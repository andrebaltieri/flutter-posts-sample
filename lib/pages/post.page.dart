import 'package:cursos/models/post.model.dart';
import 'package:cursos/repositories/post.repository.dart';
import 'package:cursos/widgets/connection-manager.widget.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final repository = new PostRepository();
  var tag = "";

  PostPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionManager(
        future: repository.getByTag(tag),
        widget: showDetails,
      ),
    );
  }

  Widget showDetails(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    Post post = snapshot.data;
    return ListView(
      children: <Widget>[
        Container(
          height: 220,
          child: Hero(
            tag: post.meta.images.post,
            child: Image.network(
              post.meta.images.post,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            post.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            post.summary,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
