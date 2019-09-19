import 'dart:convert';
import 'package:cursos/models/post.model.dart';
import 'package:http/http.dart';

class PostRepository {
  var client = new Client();

  Future<List<Post>> get() async {
    final response = await client.get('https://api.balta.io/v1/posts');
    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var posts = new List<Post>();

      for (dynamic item in list) {
        var post = new Post();
        post.title = item["title"];
        post.meta.url = item["meta"]["url"];
        post.meta.images.post = item["meta"]["images"]["post"];
        posts.add(post);
      }

      return posts;
    } else {
      throw Exception('Deu ruim!');
    }
  }

  Future<Post> getByTag(String tag) async {
    final response = await client.get('https://api.balta.io/v1/posts/$tag');
    if (response.statusCode == 200) {
      var item = json.decode(response.body) as dynamic;
      var post = new Post();

      post.title = item["title"];
      post.summary = item["summary"];
      post.meta.url = item["meta"]["url"];
      post.meta.images.post = item["meta"]["images"]["post"];

      return post;
    } else {
      throw Exception('Deu ruim!');
    }
  }
}
