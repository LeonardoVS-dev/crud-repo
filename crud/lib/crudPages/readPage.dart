import 'package:flutter/material.dart';
import 'package:crud/apiFuncs/api.dart';
import 'package:crud/apiFuncs/users.dart';

import 'dart:convert';

class readPage extends StatefulWidget {
  const readPage({super.key});

  @override
  State<readPage> createState() => _readPageState();
}

class _readPageState extends State<readPage> {
  var users = List<GetUser>.empty();

  _getUsers() {
    
    getAPI.getUsers().then((response) => 
      setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => GetUser.fromJson(model)).toList();
      },)
    );
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6750a4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pushNamed(context, '/index');
          },
        ),
        actions: [
          IconButton(onPressed: _getUsers, icon: const Icon(Icons.refresh, color: Colors.white,),)
        ],
        title: Text('Read', style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(users[index].idUser),
                    subtitle: Text('Login: ${users[index].login}; Password: ${users[index].password}'),
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      )
    );
  }
}
