import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/controller/teachers/teacher_controller.dart';
import 'package:newwa/model/subject_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TeachersScreen extends StatelessWidget {
  final SubjectModel? subData;
  TeachersScreen({required this.subData});
  final TeacherController levelController = Get.put(TeacherController());

  @override
  Widget build(BuildContext context) {
    levelController.getTeachersByIdOfSubject(subData!.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 208, 119),
        title: Center(
          child: Text('قسم ${subData!.title} '),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetBuilder<TeacherController>(
            builder: (controller) {
              if (controller.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.teacherData.isEmpty) {
                return const Center(
                  child: Text('لا يوجد مدرسين لهذا التخصص'),
                );
              }
              return ListView.builder(
                  itemCount: controller.teacherData.length,
                  itemBuilder: (c, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: const Color.fromRGBO(233, 236, 236, 1),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 90, bottom: 40, top: 20, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("الأسم:  " +
                                            '${controller.teacherData[i].name}')
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("العنوان:  " +
                                            '${controller.teacherData[i].address}')
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("البريد الإيكتروني:  " +
                                            '${controller.teacherData[i].email}')
                                      ],
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 80),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(width: 10),
                                        InkWell(
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.red,
                                            ),
                                            onTap: () async {
                                              await launch('https://wa.me/+967'+'${controller.teacherData[i].phone}');
                                            }),
                                        InkWell(
                                            child: Icon(
                                              Icons.message,
                                              color: Colors.red,
                                            ),
                                            onTap: () {}),
                                        InkWell(
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            onTap: () {}),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    );
                  });
            },
          )),
        ],
      )),
    );
  }
}
