import 'package:flutter/material.dart';



class SettinScreen extends StatefulWidget {
  SettinScreen({Key? key}) : super(key: key);

  @override
  State<SettinScreen> createState() => _SettinScreenState();
}

class _SettinScreenState extends State<SettinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Column(
        children: [SizedBox(width: MediaQuery.of(context).size.width,height: 100.0,),
      ListTile(leading: Icon(Icons.settings,color: Colors.yellow,),title:Text("المشاكل"),),
       ListTile(leading: Icon(Icons.exit_to_app,color: Colors.yellow,),title:Text("خروج"),),
      ],),

    );
  }
}