import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/model/level_model.dart';
import 'package:newwa/screens/student/teachers_screen.dart';

class SubjectScreen extends StatelessWidget {
  final LevelModel leveldata;
  const SubjectScreen({required this.leveldata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 144, 208, 119),
          title: Center(
            child: Text('قسم ${leveldata.title} '),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: leveldata.subjects.length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(TeachersScreen(subData: leveldata.subjects[i]));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: const Color.fromARGB(255, 81, 186, 172),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(children: [
                              SizedBox(
                                height: 100,
                                width: 270,
                                child: Image.network(
                                  '${leveldata.subjects[i].img}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${leveldata.subjects[i].title}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 13, 13, 13),
                                      
                                    ),
                                  )
                                ],
                              )
                            ]),
                          )
                        ]),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
