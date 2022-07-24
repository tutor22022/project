import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newwa/model/teacher_model.dart';

class TeacherController extends GetxController {
  final _teacherRef = FirebaseFirestore.instance.collection('Teachers');

  bool loading = false;
  List<TeachertModel> teacherData = [];
  Future<void> getTeachersByIdOfSubject(String? subjectId) async {
    loading = true;
    update();
    final data =
        await _teacherRef.where('subjects', arrayContains: subjectId).get();
    teacherData = data.docs.map((e) {
      return TeachertModel.fromJson(e.data());
    }).toList();
    loading = false;
    update();
  }
}
