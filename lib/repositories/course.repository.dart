import 'dart:convert';
import 'package:cursos/models/course.model.dart';
import 'package:http/http.dart';

class CourseRepository {
  var client = new Client();

  Future<List<Course>> get() async {
    final response = await client.get('https://api.balta.io/v1/courses');
    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var courses = new List<Course>();

      for (dynamic item in list) {
        var course = new Course();
        course.title = item["title"];
        course.tag = item["tag"];
        courses.add(course);
      }

      return courses;
    } else {
      throw Exception('Deu ruim!');
    }
  }
}
