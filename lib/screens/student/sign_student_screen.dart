import 'package:flutter/material.dart';
import 'package:newwa/controller/users/auth_controller.dart';
import 'package:newwa/model/student_model.dart';
import 'package:newwa/shared_widget/custom_text_field.dart';
import 'package:get/get.dart';

class StudentSign extends StatelessWidget {
  final int _currentIndex = 1;

  final TextEditingController confirmpasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.put(AuthController());
  final StudentModel studentModel = StudentModel();

  void save() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      loadinDialog();
      controller.signUpStudent(student: studentModel).then((value){
        if(Get.isDialogOpen == true){
              // done();
          Get.back();
        }
    
      });
    }
  }
  void done() {
    Get.defaultDialog(
      title: '',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [Icon(Icons.done), Text('تم انشاء الحساب بنجاح')],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 30,
                ),
                child: const Icon(
                  Icons.school,
                  size: 50,
                  color: Color.fromARGB(255, 234, 212, 71),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
                child: CustomTextField(
                  save: (val) {
                    studentModel.name = val;
                  },
                  keyboardType: TextInputType.text,
                  title: "الأسم الأول",
                  prefixicon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 34, 204, 65),
                  ),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجى أدخال الأسم الأول';
                    }
                    return null;
                  },
                ),
              ),
             
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                child: CustomTextField(
                  save: (val) {
                    studentModel.email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  title: "البريد الألكتروني",
                  prefixicon: const Icon(Icons.email,
                      color: Color.fromARGB(255, 34, 204, 65)),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجى أدخال البريد الألكتروني';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                child: CustomTextField(
                  save: (val) {
                    studentModel.phone = val;
                  },
                  len: 9,
                  keyboardType: TextInputType.number,
                  title: "رقم الهاتف",
                  prefixicon: const Icon(Icons.phone,
                      color: Color.fromARGB(255, 34, 204, 65)),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجى أدخال الهاتف';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                child: CustomTextField(
                  save: (val) {
                    studentModel.address = val;
                  },
                  keyboardType: TextInputType.text,
                  title: "العنوان",
                  prefixicon:
                      const Icon(Icons.home, color: Color.fromARGB(255, 34, 204, 65)),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'الرجاء ادخال العنوان';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                margin: const EdgeInsets.symmetric(vertical: 1),
                child: CustomTextField(
                  Controller: confirmpasswordController,
                  save: (val) {
                    studentModel.password = val;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  title: "كلمة المرور",
                  prefixicon: const Icon(Icons.vpn_key,
                      color: Color.fromARGB(255, 34, 204, 65)),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجى أدخال كلمة امرور';
                    }
                    if (val.length < 6) {
                      return 'كلمة المرور قصيرة';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                margin: const EdgeInsets.symmetric(vertical: 1),
                child: CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  save: (val) {},
                  title: " تأكيد كلمة المرور ",
                  prefixicon: const Icon(Icons.vpn_key,
                      color: Color.fromARGB(255, 34, 204, 65)),
                  focusBorderColor: const Color.fromARGB(255, 34, 204, 65),
                  validate: (String? val) {
                    // print(studentModel.password);
                    if (val!.trim().toString().isEmpty) {
                      return 'يرجا اعادة ادخال كلمة المرور';
                    }
                    if (val.length < 6) {
                       return 'كلمة المرور قصيرة';
                    }
                    if (confirmpasswordController.text != val) {
                      return 'كلمة السر غير متطابقة';
                    }
                    return null;
                  },
                ),
              ),
              
            
              GetBuilder<AuthController>(
                builder: (_) => Center(
                  child: InkWell(
                    onTap: () => null,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                        height: 50.0, // عرض وطول البوتون الاصلي
                        width: 200.0,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0.0, 20.0), // اتجاه ظل البوتون
                                  blurRadius: 30.0, // وضوح ظل البوتون
                                  color: Colors.black)
                            ],
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(22.0)),
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
                                    "إنشاء" ,
                                    style:
                                     Theme.of(context).textTheme.button,
                                  )),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(95.0),
                                      topLeft: Radius.circular(95.0),
                                      bottomRight: Radius.circular(80.0))),
                            ),
                            const Icon(Icons.account_circle_rounded, size: 30.0),
                          ],
                        )),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
