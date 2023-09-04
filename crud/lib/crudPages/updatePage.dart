import 'package:flutter/material.dart';
import 'package:crud/apiFuncs/api.dart';
import 'package:crud/apiFuncs/users.dart';

import 'dart:convert';

class updatePage extends StatefulWidget {
  const updatePage({super.key});

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
  var users = List<readUser>.empty();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  double altura = 18;
  late String login;
  late String password;


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
        backgroundColor: Color(0xff6750a4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pushNamed(context, '/index');
          },
        ),
        title: Text('Update', style: Theme.of(context).textTheme.displayLarge,),
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
                                title: Text('Editar o registro de ID  ${users[index].idUser}', 
                                  style: TextStyle(fontSize: 18, ),
                                  textAlign: TextAlign.center,
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _loginController,
                                        maxLength: 50,
                                        style: const TextStyle(
                                          fontSize: 12
                                        ),
                                        decoration:  InputDecoration(
                                          contentPadding: const EdgeInsets.only(bottom: 5,),
                                          labelText: 'Login',
                                          labelStyle: Theme.of(context).textTheme.labelMedium,
                                          enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                                          ),
                                          suffix: IconButton(icon: const Icon(Icons.clear), onPressed: () {
                                            _loginController.clear();
                                          },
                                          ),
                                        
                                        ),
                                      ),
                                      SizedBox(height: altura,),
                                      TextFormField(
                                        obscureText: true,
                                        controller: _passwordController,
                                        maxLength: 20,
                                        style: const TextStyle(
                                          fontSize: 12
                                        ),
                                        decoration:  InputDecoration(
                                          contentPadding: const EdgeInsets.only(bottom: 5,),
                                          labelText: 'Password',
                                          labelStyle: Theme.of(context).textTheme.labelMedium,
                                          enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                                          ),
                                          suffix: IconButton(icon: const Icon(Icons.clear), onPressed: () {
                                            _passwordController.clear();
                                          },),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                    /*delAPI.delUsers(users[index].idUser);
                                    Navigator.of(context).pop();
                                    _getUsers();
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                                    
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      }, 
                      icon: Icon(Icons.edit)
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