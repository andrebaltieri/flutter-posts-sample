class Tag {
  String sId;
  String tag;
  String title;

  Tag({this.sId, this.tag, this.title});

  Tag.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tag = json['tag'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tag'] = this.tag;
    data['title'] = this.title;
    return data;
  }
}
