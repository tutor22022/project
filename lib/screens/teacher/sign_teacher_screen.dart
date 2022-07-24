
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/controller/users/auth_controller.dart';
import 'package:newwa/model/teacher_model.dart';
import 'package:newwa/shared_widget/custom_text_field.dart';
import 'package:newwa/screens/teacher/select_subjects.dart';

class TeacherSign extends StatefulWidget {
  const TeacherSign({Key? key}) : super(key: key);

  @override
  State<TeacherSign> createState() => _TeacherSignState();
}

//TextEditingController confirmpasswordController = new TextEditingController();

class _TeacherSignState extends State<TeacherSign> {
  final TextEditingController passwordController = TextEditingController();

  final TeachertModel _teachertModel = TeachertModel();
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  final selectSubjectsController = Get.put(SelectSubjectsController());

  void save() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      loadinDialog();
      controller.signUpTeacher(teacher: _teachertModel).then((value) {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
       // done();
      });
    }
  }

  void loadinDialog() {
    Get.defaultDialog(
      onWillPop: (() async => false),
      title: '',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [CircularProgressIndicator(), Text('ارجاء اانتظار..')],
      ),
    );
  }

  // void done() {
  //   Get.defaultDialog(
  //     // onWillPop: (() async => false),
  //     title: '',
  //     // barrierDismissible: true,

  //     content: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Icon(Icons.done),
  //         Text('تم انشاء الحساب بنجاح')
  //       ], //تم انشاء الحساب بنجاح
  //     ),
  //   );
  // }

  String scientific_insurance = 'a';
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(
                right: 10,
                left: 20,
                top: 20,
              ),
              child: const Icon(
                Icons.edit_rounded,
                size: 50,
                color: Colors.green,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
              child: CustomTextField(
                // Controller: emailController,
                keyboardType: TextInputType.text,
                save: (val) {
                  _teachertModel.name = val;
                },
                title: "الأسم",
                prefixicon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 34, 204, 65),
                ),
                focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                validate: (String? val) {
                  if (val!.trim().toString().isEmpty) {
                    return 'يرجى أدخال الأسم ';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: CustomTextField(
                len: 9,
                keyboardType: TextInputType.number,
                save: (val) {
                  _teachertModel.phone = val;
                },
                title: "رقم الهاتف",
                prefixicon: const Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 34, 204, 65),
                ),
                focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                validate: (String? val) {
                  if (val!.trim().toString().isEmpty) {
                    return 'يرجا ادخال رقم الهاتف';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: CustomTextField(
                keyboardType: TextInputType.text,
                save: (val) {
                  _teachertModel.email = val;
                },
                title: "البريد الالكتروني",
                prefixicon: const Icon(
                  Icons.email_outlined,
                  color: Color.fromARGB(255, 34, 204, 65),
                ),
                focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                validate: (String? val) {
                  if (val!.trim().toString().isEmpty) {
                    return 'يرجا ادخال البريد االكتروني ';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: CustomTextField(
                  keyboardType: TextInputType.text,
                  save: (val) {
                    _teachertModel.address = val;
                  },
                  title: "العنوان",
                  prefixicon: const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 34, 204, 65),
                  ),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجاء ادخال العنوان';
                    }
                    return null;
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: CustomTextField(
                Controller: passwordController,
                save: (val) {
                  _teachertModel.password = val;
                },
                keyboardType: TextInputType.visiblePassword,
                title: "كلمة السر ",
                prefixicon: const Icon(
                  Icons.vpn_key_sharp,
                  color: Color.fromARGB(255, 34, 204, 65),
                ),
                focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                validate: (String? val) {
                  if (val!.trim().toString().isEmpty) {
                    return 'الرجا ادخال كلمة سر';
                  }
                  if (val.length < 6) {
                    return 'كلمة المرور قصيرة';
                  }

                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: CustomTextField(
                save: (val) {},
                keyboardType: TextInputType.visiblePassword,
                title: " تاكيد كلمة السر ",
                prefixicon: const Icon(
                  Icons.vpn_key_sharp,
                  color: Color.fromARGB(255, 34, 204, 65),
                ),
                focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                validate: (String? val) {
                  if (val!.trim().toString().isEmpty) {
                    return 'الرجا ادخال تاكيد كلمة سر';
                  }
                  if (val.length < 6) {
                    return 'كلمة المرور قصيرة';
                  }
                  if (passwordController.text != val) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SelectSubjects());
              },
              child:
                  const Text('اختيار المواد', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 152, 169, 74),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            GetBuilder<AuthController>(
              builder: (_) => Center(
                child: InkWell(
                  onTap: () => null,
                  child: Container(
                      height: 50.0, // عرض وطول البوتون الاصلي
                      width: 200.0,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0.0, 20.0), // اتجاه ظل البوتون
                                blurRadius: 20.0, // وضوح ظل البوتون
                                color: Colors.black)
                          ],
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12.0),
                            height: 50.0,
                            width: 160.0,
                            child: MaterialButton(
                                onPressed: save,
                                child: Text(
                                  "انشاء ",
                                  style: Theme.of(context).textTheme.button,
                                )),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0))),
                          ),
                          const Icon(Icons.account_circle_rounded, size: 30.0),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ]),
        ),
      ),
    );

    //  if (formKey.currentState!.validate()){
    //   controller.signUpTeacher(name: nameController.text.trim() , email: email, password: password, adress: adress, phone: phone)
    //  }
  }
}
