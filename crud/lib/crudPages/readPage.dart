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
  var users = List<readUser>.empty();

  _getUsers() {
    
    readAPI.getUsers().then((response) => 
      setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => readUser.fromJson(model)).toList();
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
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(users[index].idUser),
                    subtitle: Text('login: ${users[index].login}\npassword: ${users[index].password}'),
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
