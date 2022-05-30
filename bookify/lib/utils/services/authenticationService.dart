import 'package:bookify/utils/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> SignOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> SignIn(AppUser user) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> SignUp(AppUser user) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      FirebaseFirestore.instance.collection('users').doc(user.email).set(
        {
          'email': user.email,
          'favorites': [],
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
