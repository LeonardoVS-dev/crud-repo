import 'package:flutter/material.dart';
import 'package:crud/apiFuncs/users.dart';
import 'package:crud/apiFuncs/api.dart';

import 'dart:convert';

class deletePage extends StatefulWidget {
  const deletePage({super.key});

  @override
  State<deletePage> createState() => _deletePageState();
}

class _deletePageState extends State<deletePage> {
  var users = List<readUser>.empty();

  _getUsers() {
    readAPI.getUsers().then((response) => 
      setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => readUser.fromJson(model)).toList();
      },)
    );
  }

  static const snackBar = SnackBar(
    content: Text('O registro foi apagado!'),
  );


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
        title: Text('Delete', style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(users[index].idUser),
                    subtitle: Text('login: ${users[index].login}\npassword: ${users[index].password}'),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text('Quer deletar este registro?'),
                                actions: [
                                TextButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Prosseguir'),
                                  onPressed: () {
                                    delAPI.delUsers(users[index].idUser);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      }, 
                      icon: Icon(Icons.more_vert)
                    ),
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