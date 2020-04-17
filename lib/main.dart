import 'package:flutter/material.dart';
import 'package:recipe_app/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
        primaryColor: Colors.orange[300]
      ),
      home: SearchScreen(),
    );
  }
}
