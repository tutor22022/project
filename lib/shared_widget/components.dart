import 'package:flutter/material.dart';

class RoundeIconButton extends StatelessWidget {
  const RoundeIconButton(
      {Key? key,
      required this.colour,
      required this.textColor,
      required this.iconColor,
      required this.title,
      required this.onPressed,
      this.buttonIcon})
      : super(key: key);
      
  final Color colour;
  final Color textColor;
  final Color iconColor;
  final String title;
  final Function onPressed;
  final buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 10.0),
      child: Material(
        elevation: 6.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Icon(
              buttonIcon,
              color: iconColor,
            ),
          ),
          MaterialButton(
            onPressed: () {
              onPressed();
            },
            minWidth: 1000.0,
            height: 42.0,
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'playfair',
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
