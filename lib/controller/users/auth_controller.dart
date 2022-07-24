import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/model/student_model.dart';
import 'package:newwa/model/teacher_model.dart';
import 'package:newwa/shared_widget/navigation_bar.dart';
import 'package:newwa/screens/student/level_sceen.dart';
import 'package:newwa/screens/teacher/select_subjects.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthController instance = Get.find();
  int userTypevalue = -1;

  StudentModel? studentUser;
  TeachertModel? teacherUser;

  final _studentRef = FirebaseFirestore.instance.collection('Students');
  final _teacherRef = FirebaseFirestore.instance.collection('Teachers');

  bool loading = false;

  Future<void> signIn(String? name, String? pass, int userType) async {
    studentUser = null;
    teacherUser = null;
    update();
    try {
      if (userType == 0) {
        final result = await _studentRef
            .where('user_name', isEqualTo: name)
            .where('password', isEqualTo: pass)
            .get();
        if (result.size > 0) {
          studentUser = StudentModel.fromJson(result.docs[0].data());
          if (studentUser!.is_enabeld == false) {
            Get.snackbar('خطأ', 'الحساب مقفل',
                snackPosition: SnackPosition.BOTTOM);
          } else {
            Get.offAll(NavigationBarScreen());
            //Get.snackbar('تسجيل الدخول', 'تم تسجيل الدخول بنجاح',snackPosition: SnackPosition.BOTTOM);

          }
        } else {
          Get.snackbar('خطأ', 'خطأ في أسم المستخم او كمة السر',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else if (userType == 1) {
        final result = await _teacherRef
            .where('user_name', isEqualTo: name)
            .where('password', isEqualTo: pass)
            .get();
        if (result.size > 0) {
          teacherUser = TeachertModel.fromJson(result.docs[0].data());
          if (teacherUser!.email == false) {
            Get.snackbar('خطأ', 'الحساب مقفل',
                snackPosition: SnackPosition.BOTTOM);
          } else {
            Get.off(LevelScreen());
            //Get.snackbar('تسجيل الدخول', 'تم تسجيل الدخول بنجاح',snackPosition: SnackPosition.BOTTOM);

          }
        } else {
          Get.snackbar('خطأ', 'خطأ في أسم المستخم او كمة السر',
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      Get.snackbar('تسجي الدخول', 'تأكد من الأتصال بالأنترنت');
    }

    update();
  }

  Future<void> signUpStudent({required StudentModel student}) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: student.email!,
        password: student.password!,
      );

      student.id = cred.user?.uid;
      await _studentRef.doc(cred.user!.uid).set(student.toJson());
      userTypevalue = 0;

      // update();
      Get.offAll(() => NavigationBarScreen());
    } catch (error) {
      error.printError();
      Get.back();
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signUpTeacher({required TeachertModel teacher}) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: teacher.email!,
        password: teacher.password!,
      );
      teacher.id = cred.user?.uid;
      teacher.subjects = Get.find<SelectSubjectsController>().selectedSubjects;

      await _teacherRef.doc(cred.user!.uid).set(teacher.toJson());
      userTypevalue = 1;
      // update();
      Get.offAll(() => NavigationBarScreen());
    } catch (error) {
      Get.back();
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  Future<void> login(String email, String pass, int userType) async {
    try {
      final cred =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      Get.offAll(NavigationBarScreen());

      if (userType == 0) {
        userTypevalue = userType;
        final res = await _studentRef.doc(cred.user?.uid).get();
        final stu = StudentModel.fromJson(res.data()!);
        if (stu.is_enabeld == false) {
          Get.snackbar("خطأ", "الحساب مقفل");
        } else {
          studentUser = stu;
          Get.offAll(NavigationBarScreen());
        }
      } else if (userType == 1) {
        userTypevalue = userType;
        final res = await _teacherRef.doc(cred.user?.uid).get();
        final tech = TeachertModel.fromJson(res.data()!);
        if (tech.is_enabeld == false) {
          Get.snackbar("خطأ", "الحساب مقفل");
        } else {
          teacherUser = tech;
          Get.offAll(NavigationBarScreen());
        }
      }
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
    update();
  }
}
