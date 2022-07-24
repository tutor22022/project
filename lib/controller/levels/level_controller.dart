import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newwa/model/level_model.dart';
import 'package:newwa/model/subject_model.dart';

class LevelController extends GetxController{
final _levelRef = FirebaseFirestore.instance.collection('Levels');
  final _subjectsRef = FirebaseFirestore.instance.collection('Subjects');

  bool loading = false;

  List<LevelModel> levels = [];

  Future<void> getLevels() async {
    loading = true;
    update();

    final data = await _levelRef.orderBy('id').get();
    levels.clear();
    for (var e in data.docs) {
      final lv = LevelModel.fromJson(e.data());
      lv.subjects = await getSubjectsById(lv.id!);
      levels.add(lv);
    }
    loading = false;
    update();
  }

  Future<List<SubjectModel>> getSubjectsById(String levelId) async {
    final data =
        await _subjectsRef.where('level_id', isEqualTo: levelId).get();
    return data.docs.map((e) => SubjectModel.fromJson(e.data())).toList();
  }

  @override
  void onInit() {
    getLevels();
    super.onInit();
  }
}