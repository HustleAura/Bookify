import 'package:bookify/routes/authPage.dart';
import 'package:bookify/routes/landPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// authentication wrapper to abstract the authentication logic from app logic
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuthState = context.watch<User?>();

    if (userAuthState == null) {
      return const AuthPage(true);
    } else {
      return const LandPage();
    }
  }
}
