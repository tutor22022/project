import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/controller/users/auth_controller.dart';
import 'package:newwa/signin_homeScreen.dart';


class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      // appBar: AppBar(title: Text('profile')),
      body: SafeArea(
        child: Column(children: const [
          ListTile(
            title: Text('{user?.name}'),
          ),
        ]),
      ),
    );
  }
}

class ProfileControllerScreen extends StatelessWidget {
  const ProfileControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
     
    return SignInHomeScreen();
    },);
  }
}
