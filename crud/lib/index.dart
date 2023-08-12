import 'package:flutter/material.dart';

class indexPage extends StatefulWidget {
  const indexPage({super.key});

  @override
  State<indexPage> createState() => _indexPageState();
}

class _indexPageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text('Select one out of the four CRUD operations:',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.large(
                    heroTag: 'b1',
                    //create
                    onPressed: () {
                      Navigator.pushNamed(context, '/create');
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.large(
                    heroTag: 'b2',
                    //read
                    onPressed: () {
                      Navigator.pushNamed(context, '/read');
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.large(
                    heroTag: 'b3',
                    //update
                    onPressed: () {
                      Navigator.pushNamed(context, '/update');
                    },
                    child: const Icon(Icons.replay_outlined),
                  ),
                  FloatingActionButton.large(
                    heroTag: 'b4',
                    //delete
                    onPressed: () {
                      Navigator.pushNamed(context, '/delete');
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}