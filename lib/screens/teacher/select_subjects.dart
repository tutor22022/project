import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/model/level_model.dart';
import 'package:newwa/model/subject_model.dart';

class SelectSubjects extends StatelessWidget {
  const SelectSubjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('اختيار المواد')),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: GetBuilder<SelectSubjectsController>(builder: (controller) {
        if (controller.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.levels.length,
          itemBuilder: (c, i) {
            return Card(
              child: ExpansionTile(
                title: Text(controller.levels[i].title!),
                children: controller.levels[i].subjects
                    .map(
                      (e) => CheckboxListTile(
                          value: controller.isSubSelected(e.id!),
                          title: Text(e.title!),
                          onChanged: (val) {
                            if (val == true) {
                              controller.addSubj(e.id!);
                            } else {
                              controller.delSubj(e.id!);
                            }
                          }),
                    )
                    .toList(),
              ),
            );
          },
        );
      }),
    );
  }
}

class SelectSubjectsController extends GetxController {
  final _levelRef = FirebaseFirestore.instance.collection('Levels');
  final _subjectsRef = FirebaseFirestore.instance.collection('Subjects');

  bool loading = false;

  List<LevelModel> levels = [];
  List<String> selectedSubjects = [];

  void addSubj(String subjId) {
    selectedSubjects.add(subjId);
    update();
  }

  void delSubj(String subjId) {
    selectedSubjects.removeWhere((s) => s == subjId);
    update();
  }

  bool isSubSelected(String subjId) {
    return selectedSubjects.any((s) => s == subjId);
  }

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
