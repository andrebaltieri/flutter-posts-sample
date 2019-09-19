import 'package:cursos/pages/home.page.dart';
import 'package:cursos/pages/post.page.dart';
import 'package:cursos/pages/posts.page.dart';
import 'package:cursos/pages/tags.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cursos do Balta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsPage(),
    );
  }
}
