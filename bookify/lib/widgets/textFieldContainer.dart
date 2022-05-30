import 'package:bookify/utils/constants.dart';

import 'package:flutter/material.dart';

// general text field container with decoration for using in text input fields.
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: lightPrimaryColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
