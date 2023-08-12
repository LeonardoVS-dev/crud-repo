import 'package:flutter/material.dart';

class updatePage extends StatefulWidget {
  const updatePage({super.key});

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
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
        title: Text('Update', style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: const Placeholder(),
    );
  }
}