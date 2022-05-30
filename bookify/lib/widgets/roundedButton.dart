import 'package:bookify/utils/constants.dart';

import 'package:flutter/material.dart';

// rounded button for displaying logout button and get premium UI
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, captionColor;
  const RoundedButton(
    this.text,
    this.press, {
    this.color = primaryColor,
    this.captionColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: captionColor,
        ),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: fontColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
