class Author {
  String sId;
  String name;
  String title;
  String image;

  Author({this.sId, this.name, this.title, this.image});

  Author.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
