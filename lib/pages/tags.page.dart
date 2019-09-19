import 'package:cursos/models/tag.model.dart';
import 'package:cursos/repositories/tag.repository.dart';
import 'package:cursos/widgets/connection-manager.widget.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatelessWidget {
  final repository = new TagRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tags"),
      ),
      body: ConnectionManager(
        future: repository.get(),
        widget: showTags,
      ),
    );
  }

  Widget showTags(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    List<Tag> tags = snapshot.data;

    return ListView.builder(
      itemCount: tags.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(tags[index].title);
      },
    );
  }
}
