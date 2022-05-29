import 'package:bookify/utils/models/userModel.dart';
import 'package:bookify/utils/services/authenticationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../widgets/inputField.dart';
import '../widgets/passwordField.dart';
import '../widgets/roundedButton.dart';

class AuthPage extends StatefulWidget {
  bool _isLogin;
  AuthPage(this._isLogin);

  @override
  State<AuthPage> createState() => _AuthPageState(_isLogin);
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin;
  _AuthPageState(this._isLogin);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    TextEditingController _emailController = TextEditingController(),
        _passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, _height * 0.1, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.fromLTRB(_height * 0.05, 0, _height * 0.05, 0),
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
                      (_isLogin) ? loginLottie : signUpLottie,
                    ),
                    height: _height * 0.5,
                    width: _width,
                  ),
                  InputField('email', Icons.add, _emailController),
                  PasswordField(
                    _passwordController,
                  ),
                  RoundedButton(
                    (_isLogin) ? 'LOGIN' : 'SIGNUP',
                    () {
                      (_isLogin)
                          ? Provider.of<AuthenticationService>(
                              context,
                              listen: false,
                            ).SignIn(
                              AppUser(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              ),
                            )
                          : Provider.of<AuthenticationService>(
                              context,
                              listen: false,
                            ).SignUp(
                              AppUser(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              ),
                            );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (_isLogin)
                            ? 'Don\'t have an account?'
                            : 'Already have an account?',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                      Container(
                        child: InkWell(
                          child: Text(
                            (_isLogin) ? ' Sign Up ' : ' Log in ',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
