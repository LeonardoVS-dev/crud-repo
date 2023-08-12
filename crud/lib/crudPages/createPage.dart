import 'package:crud/apiFuncs/api.dart';
import 'package:flutter/material.dart';

class createPage extends StatefulWidget {
  const createPage({super.key});

  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  late String name;
  late String email;
  late String phone;
  double altura = 18;

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
                    controller: _nameController,
                    maxLength: 60,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5,),
                      icon: const Icon(Icons.account_circle),
                      labelText: 'Name',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      suffix: IconButton(icon: const Icon(Icons.clear), onPressed: () {
                        _nameController.clear();
                      },),
                    ),
                  ),
                  SizedBox(height: altura,),
                  TextFormField(
                    controller: _emailController,
                    maxLength: 50,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5,),
                      icon: const Icon(Icons.mail),
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      suffix: IconButton(icon: const Icon(Icons.clear), onPressed: () {
                        _emailController.clear();
                      },
                      //iconSize: 10,
                      //splashRadius: 2,
                      ),
                    
                    ),
                  ),
                  SizedBox(height: altura,),
                  TextFormField(
                    controller: _phoneController,
                    maxLength: 20,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5,),
                      icon: const Icon(Icons.phone),
                      labelText: 'Phone',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      suffix: IconButton(icon: const Icon(Icons.clear), onPressed: () {
                        _phoneController.clear();
                      },),
                    ),
                  ),
                  SizedBox(height: altura,),
                  SizedBox(height: altura,),
                  ElevatedButton(
                    onPressed: () {
                      name = _nameController.toString();
                      email = _emailController.toString();
                      phone = _phoneController.toString();

                      _postUser() {
                        postAPI.postUsers(name, email, phone);
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