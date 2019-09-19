import 'dart:convert';
import 'package:cursos/models/tag.model.dart';
import 'package:http/http.dart';

class TagRepository {
  var client = new Client();

  Future<List<Tag>> get() async {
    final response = await client.get('https://api.balta.io/v1/tags');
    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var tags = new List<Tag>();

      for (dynamic item in list) {
        var tag = new Tag();
        tag.title = item["title"];
        tag.tag = item["tag"];
        tags.add(tag);
      }

      return tags;
    } else {
      throw Exception('Deu ruim!');
    }
  }
}
