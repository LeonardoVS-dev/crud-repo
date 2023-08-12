import 'package:flutter/material.dart';
import 'package:crud/crudPages/createPage.dart';
import 'package:crud/crudPages/deletePage.dart';
import 'package:crud/crudPages/readPage.dart';
import 'package:crud/crudPages/updatePage.dart';
import 'index.dart';

void main() {
  runApp(const mainApp());
}

class mainApp extends StatelessWidget {
  const mainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const indexPage(),
      routes: {
        '/index': (context) => const indexPage(),
        '/create': (context) => const createPage(),
        '/read': (context) => const readPage(),
        '/delete': (context) => const deletePage(),
        '/update': (context) => const updatePage(),
      },
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 6,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 143, 142, 146),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
          ),
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )
        )
      ),
      debugShowCheckedModeBanner: false
    );
  }
} 