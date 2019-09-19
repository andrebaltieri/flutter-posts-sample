import 'package:cursos/models/course.model.dart';
import 'package:cursos/repositories/course.repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final repository = new CourseRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cursos do balta"),
      ),
      body: FutureBuilder(
        future: repository.get(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  child: Text("Aguarde..."),
                ),
              );
            default:
              if (snapshot.hasError)
                return new Text(snapshot.error);
              else
                return showCourses(context, snapshot);
          }
        },
      ),
    );
  }

  Widget showCourses(BuildContext context, AsyncSnapshot snapshot) {
    List<Course> courses = snapshot.data;

    return Container(
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(courses[index].title);
        },
      ),
    );
  }
}
