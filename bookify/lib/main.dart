import 'package:bookify/utils/services/authenticationService.dart';
import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/authenticationWrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Bookify());
}

class Bookify extends StatelessWidget {
  const Bookify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AuthenticationService>(
      create: (_) => AuthenticationService(FirebaseAuth.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: primaryColor,
          // ),
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}
