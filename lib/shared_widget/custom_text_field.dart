import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? len;
  final String? title;
  final Function? validate;
  final Function? save;
  final TextEditingController? Controller;
  final Icon? prefixicon;
  final Color focusBorderColor;
  final TextInputType? keyboardType ;

  const CustomTextField({
   this.len,
  required this.title, 
  required this.validate,
  required this.save,
  required this.prefixicon,
  required  this.focusBorderColor,
  required this.keyboardType,
  this.Controller,});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
      maxLength: len,
        controller: Controller,
        validator: validate as String? Function(String?)?,
        onSaved: save as String? Function(String?)?,
        keyboardType: keyboardType,
        style: const TextStyle(
            fontSize: 15
        ),
        
        decoration: InputDecoration(
         
         prefixIcon: prefixicon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          fillColor: Colors.white,
            filled: true,
            labelText: title ,
            

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(
                    color: focusBorderColor
            )),
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
    );
  }
}
