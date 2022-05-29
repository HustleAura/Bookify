import 'package:bookify/routes/authPage.dart';
import 'package:bookify/widgets/inputField.dart';
import 'package:bookify/widgets/passwordField.dart';
import 'package:bookify/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sample = 'sample';

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Bookify',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        color: primaryColor,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Lottie.asset(
                    welcomeLottie,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                ),
                RoundedButton(
                  'LOGIN',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthPage(true),
                      ),
                    );
                  },
                ),
                RoundedButton(
                  'SIGNUP',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthPage(false),
                      ),
                    );
                  },
                  color: lightPrimaryColor,
                  captionColor: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
