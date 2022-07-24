import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/WelcomeScreen.dart';
import 'package:newwa/controller/users/auth_controller.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(essamcod());
}

class essamcod extends StatelessWidget {
 essamcod({Key? key}) : super(key: key);
  final a = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
       debugShowCheckedModeBanner: false  ,
        title: 'المعلم الخصوصي',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: WelcomeScreen(),

        // initialRoute: WelcomeScreen.id,
        // routes: {
        //   WelcomeScreen.id: (context) => WelcomeScreen(),
        //   HomeScreen.id: (context) => HomeScreen(),
        
        //   SignWithScreen.id:(context) => SignWithScreen(),
       


          
          
          
        // }
        );
  }
}
