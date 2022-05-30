import 'package:bookify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'textFieldContainer.dart';

// password text field using the text field container
class PasswordField extends StatelessWidget {
  final TextEditingController _passwordController;
  const PasswordField(
    this._passwordController,
  );

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        cursorColor: primaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
