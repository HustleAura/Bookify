import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/likedBook.dart';
import 'package:bookify/utils/models/bookModel.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // reference to the user document in the firebase users collection
  final userReference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.email);

  @override
  Widget build(BuildContext context) {
    // caption of the page
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Favorites : ',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: fontColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // list of books taken as a snapshot from the stream of user data displayed
          Expanded(
            flex: 10,
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: userReference.snapshots(),
              builder: (context, snapshot) {
                var _favoriteList = snapshot.data?.data()?['favorites'] ?? [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('data');
                } else {
                  return ListView.builder(
                    itemCount: _favoriteList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LikedBook(
                        Book(
                          _favoriteList[index],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
