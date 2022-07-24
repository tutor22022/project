import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'homeScreen';
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 182, 13),
        title:const Center(child: Text('تطبيق المعلم الخصوصي')),
        
       
        actions: [
          IconButton(icon: const Icon(Icons.person,color: Color.fromARGB(255, 68, 231, 78),),
          onPressed: (){
            //Navigator.pushNamed(context,UserProfileScreen.id );
          },
          
          ),
         
        ],

      ),
        body: Container(
          child: const Text('essam'),

         /* height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/homeScreenTop.png',
                  width: size.width,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: Text(
                      'Home Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ), //هذا من اجل انزال الازرار لي الاسفل

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //لتوسيط الازرار
                    children: [
                      RaisedButton(
                          child: Text('photos'),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, PhotusScreen.id);
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      //هذا تصميم زر الانتقال
                      RaisedButton(
                          child: Text('videos'),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, VideosScreen.id);
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),*/
      ),
      
      ),
    );
    
  }
}
