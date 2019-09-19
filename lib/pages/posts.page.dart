import 'package:cursos/models/post.model.dart';
import 'package:cursos/pages/post.page.dart';
import 'package:cursos/repositories/post.repository.dart';
import 'package:cursos/widgets/connection-manager.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PostsPage extends StatelessWidget {
  final repository = new PostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionManager(
        future: repository.get(),
        widget: showPosts,
      ),
    );
  }

  Widget showPosts(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    List<Post> posts = snapshot.data;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (BuildContext ctx, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  tag: posts[index].meta.url,
                ),
              ),
            );
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Hero(
              tag: posts[index].meta.images.post,
              child: Image.network(
                posts[index].meta.images.post,
                fit: BoxFit.fill,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        );
      },
    );
  }
}
