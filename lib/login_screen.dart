import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/controller/levels/level_controller.dart';
import 'package:newwa/controller/users/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final int _currentIndex = 0;

  final formKey = GlobalKey<FormState>();

  String name = '';

  String password = '';

  final LevelController levelcontroller = Get.put(LevelController());

  final AuthController loginController = Get.put(AuthController());

  int dropdownvalue = 0;
  bool isObscureText = true;

  var itemsList = [
    'طالب',
    'معلم',
  ];

  void login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      AuthController.instance.login(name, password, dropdownvalue);
      
    }
  }
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 183, 35),
        title: const Center(
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/key.jpg',
            ),
            Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? val) {
                          if (val!.trim().toString().isEmpty) {
                            return 'يرجى أدخال  البريد الإليكتروني';
                          }
                          return null;
                        },
                        onSaved: (String? val) {
                          name = val!.trim();
                        },
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'البريد الإليكتروني ',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide()),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: isObscureText,
                        validator: (String? val) {
                          if (val!.trim().toString().isEmpty) {
                            return 'يرجى أدخال كمة المرور';
                          }

                          return null;
                        },
                        onSaved: (String? val) {
                          password = val!.trim();
                        },
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(isObscureText == true
                                    ? Icons.visibility_sharp
                                    : Icons
                                        .enhanced_encryption)), //remove_red_eye

                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'كلمة المرور',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide()),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: itemsList.map((String items) {
                        return DropdownMenuItem(
                          value: itemsList.indexOf(items),
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (int? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => null,
                        child: Container(
                          height: 50.0, // عرض وطول البوتون الاصلي
                          width: 200.0,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset:
                                        Offset(0.0, 0.0), // اتجاه ظل البوتون
                                    blurRadius: 30.0, // وضوح ظل البوتون
                                    color: Colors.black)
                              ],
                              color: const Color.fromARGB(255, 232, 202, 80),
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12.0),
                                height: 50.0,
                                width: 160.0,
                                child: MaterialButton(
                                    onPressed: login,
                                    child: Text(
                                      "دخول",
                                      style: Theme.of(context).textTheme.button,
                                    )),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(95.0),
                                        topLeft: Radius.circular(95.0),
                                        bottomRight: Radius.circular(200.0))),
                              ),
                              const Icon(Icons.directions_run_rounded, size: 30.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
