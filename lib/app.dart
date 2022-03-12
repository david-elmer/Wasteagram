import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: ListScreen(),
    );
  }

}