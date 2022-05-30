import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// like button used in the book interface
class LikeButton extends StatefulWidget {
  final String _bookTitle;
  const LikeButton(this._bookTitle);

  @override
  State<LikeButton> createState() => _LikeButtonState(_bookTitle);
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;
  Color _iconColor = Colors.grey;
  final String _bookTitle;
  _LikeButtonState(this._bookTitle);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(
          () {
            _liked = !_liked;
            if (_liked) {
              _iconColor = Colors.red;
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser?.email)
                  .update(
                {
                  'favorites': FieldValue.arrayUnion([_bookTitle]),
                },
              );
            } else {
              _iconColor = Colors.grey;
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser?.email)
                  .update(
                {
                  'favorites': FieldValue.arrayRemove([_bookTitle]),
                },
              );
            }
          },
        );
      },
      icon: Icon(
        Icons.favorite,
        color: _iconColor,
      ),
    );
  }
}
