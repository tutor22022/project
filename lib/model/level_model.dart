import 'package:newwa/model/subject_model.dart';

class LevelModel {
  String? id;
  String? title;
  List<SubjectModel> subjects = [];

  LevelModel({this.id, this.title});

  LevelModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    

  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      
    };
  }
}