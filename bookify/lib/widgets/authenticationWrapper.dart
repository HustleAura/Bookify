import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/authPage.dart';
import '../routes/landPage.dart';
import '../utils/services/authenticationService.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(
      context,
      listen: false,
    );
    final authChangeStateStream = authService.authStateChanges;

    return StreamBuilder<User?>(
      stream: authChangeStateStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return (snapshot.data == null) ? AuthPage(true) : LandPage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        ;
      },
    );
  }
}
