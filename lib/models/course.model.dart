import 'author.model.dart';

class Course {
  int level;
  int duration;
  bool featured;
  bool isnew;
  int price;
  String color;
  int views;
  String sId;
  String title;
  String tag;
  String summary;
  String video;
  String category;
  String tags;
  String career;
  Author author;
  String createDate;
  String lastUpdateDate;

  Course(
      {this.level,
      this.duration,
      this.featured,
      this.isnew,
      this.price,
      this.color,
      this.views,
      this.sId,
      this.title,
      this.tag,
      this.summary,
      this.video,
      this.category,
      this.tags,
      this.career,
      this.author,
      this.createDate,
      this.lastUpdateDate});

  Course.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    duration = json['duration'];
    featured = json['featured'];
    isnew = json['isnew'];
    price = json['price'];
    color = json['color'];
    views = json['views'];
    sId = json['_id'];
    title = json['title'];
    tag = json['tag'];
    summary = json['summary'];
    video = json['video'];
    category = json['category'];
    tags = json['tags'];
    career = json['career'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    createDate = json['createDate'];
    lastUpdateDate = json['lastUpdateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['duration'] = this.duration;
    data['featured'] = this.featured;
    data['isnew'] = this.isnew;
    data['price'] = this.price;
    data['color'] = this.color;
    data['views'] = this.views;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['summary'] = this.summary;
    data['video'] = this.video;
    data['category'] = this.category;
    data['tags'] = this.tags;
    data['career'] = this.career;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['createDate'] = this.createDate;
    data['lastUpdateDate'] = this.lastUpdateDate;
    return data;
  }
}
