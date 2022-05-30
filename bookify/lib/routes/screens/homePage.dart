// local imports and libraries
import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:bookify/widgets/bookTile.dart';
import 'package:bookify/utils/models/bookModel.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// each button in the genre UI
class GenreButton extends StatelessWidget {
  final String _caption;
  final Color _color;
  const GenreButton(this._caption, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          // getSearchRecommendation('da vinci code');
        },
        child: Text(
          _caption,
          style: GoogleFonts.kanit(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_color),
        ),
      ),
    );
  }
}

// set of two buttons combined to use together
class ButtonRow extends StatelessWidget {
  final String _caption1, _caption2;
  const ButtonRow(this._caption1, this._caption2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 0,
      ),
      child: Row(
        children: [
          GenreButton(_caption1, primaryColor),
          GenreButton(_caption2, secondaryColor),
        ],
      ),
    );
  }
}

// Home Page Widget to be displayed on the screen
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // reference to the user document in the firebase collection
    final userDocStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .snapshots();

    return Column(
      children: [
        // uppersection of recommended books
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Text(
                  'Based on what you like :',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: userDocStream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> mapSnapshot) {
                  final favoriteList = mapSnapshot.data.data()['favorites'];
                  if (favoriteList.isEmpty) {
                    return const Text(
                      'Hey ! You seem to be new here. Have a look at the explore page',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                      ),
                    );
                  } else {
                    final bookList = userRecommendationList(favoriteList.last);

                    return FutureBuilder(
                      future: bookList,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> listSnapshot) {
                        if (listSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (listSnapshot.hasError) {
                          return const Text(
                            'Umm I guess something went wrong. Restarting the app might work?',
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listSnapshot.data.length,
                            itemBuilder: ((context, index) {
                              return BookTile(
                                Book(
                                  listSnapshot.data[index],
                                ),
                              );
                            }),
                          );
                        }
                      },
                    );
                  }
                }),
          ),
        ),

        // lower section of genre UI
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Our most loved genres :',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: ListView(
            children: const [
              ButtonRow('SCI-FI', 'ACTION'),
              ButtonRow('COMEDY', 'DRAMA'),
              ButtonRow('THRILLER', 'ROMANCE'),
            ],
          ),
        ),
      ],
    );
  }
}
