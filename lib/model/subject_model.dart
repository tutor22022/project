class SubjectModel {
  String? id;
  String? level_id;
  String? title;
  String? img;

  SubjectModel({this.id, this.title, this.img, this.level_id});

  SubjectModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    img = map['img'];
    level_id = map['level_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "img": img,
      "level_id": level_id,
    };
  }
}
