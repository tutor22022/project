import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newwa/login_screen.dart';
import 'package:newwa/shared_widget/navigation_bar.dart';
import 'package:newwa/signin_with_screen.dart';


class SignInHomeScreen extends StatefulWidget {
  static const id = 'loginScreen';
  

  @override
  State<SignInHomeScreen> createState() => _SignInHomeScreenState();
}

class _SignInHomeScreenState extends State<SignInHomeScreen> {
  get white => null;
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: size.height,
          width: double.infinity,
          child: Stack(children: [
            Column(   
              children: [
                Center(
                  child: SizedBox(
                    height: size.height /1.8,
                    width: size.width /1,
                    child: Image.asset(
                      'assets/images/sharmce.png',
                      //width: size.width /1.5,
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
            
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:60.0),
                  child:
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
                                          Offset(0.0, 20.0), // اتجاه ظل البوتون
                                      blurRadius: 40.0, // وضوح ظل البوتون
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
                                      onPressed:(){
                                                  Get.to(LoginScreen());
                                                  },
                  
                                      child: Text(
                                        "تسجيل الدخول",
                                        style:
                                            Theme.of(context).textTheme.button,
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
                InkWell(
                  onTap: (){
                    //Get.to(SignInWith());
                  },
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(child: 
                      const Text(' لا أملك حساب؟',style: TextStyle(color: Colors.black),
                      ), padding: const EdgeInsets.only(right: 20, left:0, top: 40),),
                      TextButton(onPressed: ()
                      {
                       Get.to(SignInWith());
                      }, child:Container(child: 
                       const Text('انشاء حساب', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      
                      ),
                       padding: const EdgeInsets.only(right: 0, left: 0, top: 40),
                      
                      ),
                      ),
                    ],
                  ),
                  
                
                ),
                 TextButton(onPressed: (
                  
                 ){
                         Get.to( NavigationBarScreen());

                 }, child:const Text('دخول كزائر'),)
                   ],
            ),
          ]
          ),
        ),
      ),
    );
  }

  navigation_bar() {}
  
}
