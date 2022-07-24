import 'package:flutter/material.dart';
import 'package:newwa/screens/student//sign_student_screen.dart';
import 'package:newwa/screens/teacher/sign_teacher_screen.dart';

class SignInWith extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // resizeToAvoidBottomInset: false ,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 217, 169, 23),
          title: const Center(child: Text('إنشاء حساب')),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'طالب',
            ),
            Tab(
              text: 'معلم',
            ),
          ]),
        ),
        body: TabBarView(children: [
          StudentSign(),
          const TeacherSign(),
        ],)
      ),
    );
  }
}
