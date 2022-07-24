import 'package:flutter/material.dart';





class LevelScreen extends StatefulWidget {
  LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              print("hello");
            },
            child: Padding(
              padding: EdgeInsets.only(top: 50,right: 50,left: 50),
              child: Container(child: Column(
                children: [
                  Image.asset('assets/images/ga.jpg',fit: BoxFit.fill,),
                  SizedBox(height: 20,),
                  Text("المرحلة الإبتدائية")
                ],
              ),
              ),
            ),
          ),InkWell(
            onTap: (){
              print("hello");
            },
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Container(child: Column(
                children: [
                  Image.asset('assets/images/ga.jpg',fit: BoxFit.fill,),
                  SizedBox(height: 20,),
                  Text("المرحلة الإبتدائية")
                ],
              ),
              ),
            ),
          ),InkWell(
            onTap: (){
              print("hello");
            },
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Container(child: Column(
                children: [
                  Image.asset('assets/images/ga.jpg',fit: BoxFit.fill,),
                  SizedBox(height: 20,),
                  Text("المرحلة الإبتدائية")
                ],
              ),
              ),
            ),
          ),
        ],
      ),
    );
   
  }
}




































// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newwa/controller/levels/level_controller.dart';
// //import 'package:newwa/model/level_model.dart';
// import 'package:newwa/screens/student/subject_screen.dart';

// class LevelScreen extends StatelessWidget {
//   final LevelController levelcontroller = Get.put(LevelController());
//   @override
//   Widget build(BuildContext context) {
//     //levelcontroller.getLevels();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 114, 208, 119),
//         title: const Center(
//           child: Text('المرحلة الدراسية'),
//         ),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           Expanded(child: GetBuilder<LevelController>(
//             builder: (controller) {
//               if (controller.loading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (controller.levels.isEmpty) {
//                 return const Center(
//                   child: Text('لا يوجد تخصصات'),
//                 );
//               }
//               return ListView.builder(
//                   itemCount: controller.levels.length,
//                   itemBuilder: (c, i) {
//                     return InkWell(
//                       onTap: () {
//                         Get.to(() => SubjectScreen(
//                               leveldata: controller.levels[i],
//                             ));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           color: const Color.fromARGB(255, 154, 121, 168),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Column(children: [
//                                   Text(
//                                     '${controller.levels[i].title}',
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       color: Color(0xFFF8F6F6),
//                                     ),
//                                   )
//                                 ]),
//                               )
//                             ]),
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//             },
//           )),
//         ],
//       )),
//     );
//   }
// }
