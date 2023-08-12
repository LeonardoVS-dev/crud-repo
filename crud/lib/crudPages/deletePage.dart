import 'package:flutter/material.dart';

class deletePage extends StatefulWidget {
  const deletePage({super.key});

  @override
  State<deletePage> createState() => _deletePageState();
}

class _deletePageState extends State<deletePage> {
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
      body: const Placeholder(),
    );
  }
}