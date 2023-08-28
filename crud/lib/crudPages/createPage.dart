import 'package:crud/apiFuncs/api.dart';
import 'package:flutter/material.dart';

class createPage extends StatefulWidget {
  const createPage({super.key});

  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
  //final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  double altura = 18;
  late String login;
  late String password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6750a4),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.pushNamed(context, '/index');
            },
          ),
          title: Text('Create', style: Theme.of(context).textTheme.displayLarge,),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _loginController,
                    maxLength: 50,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5,),
                      icon: const Icon(Icons.account_circle),
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
                      fontSize: 14
                    ),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5,),
                      icon: const Icon(Icons.lock),
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
                  SizedBox(height: altura,),
                  SizedBox(height: altura,),
                  ElevatedButton(
                    onPressed: () {
                     if(_loginController.text.isEmpty || _passwordController.text.isEmpty) {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                              return AlertDialog(
                                content: const Text('É preciso preencher os dois campos para poder gravar.'),
                                actions: [
                                TextButton(
                                  child: const Text('Voltar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      }
                      else {
                        login = _loginController.text;
                        password = _passwordController.text;
                        addAPI.addUsers(login, password);
                      }
                    },
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(6),
                      padding: MaterialStatePropertyAll(EdgeInsets.only(top: 20, bottom: 20, left: 35, right: 35)),
                      //maximumSize: MaterialStatePropertyAll(Size(50, 75))
                    ),
                    child: const Text('Send'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}