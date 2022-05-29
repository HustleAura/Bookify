import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:bookify/widgets/bookTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/models/bookModel.dart';
import 'favoritePage.dart';

int bookCount = 0;
Future<List<dynamic>> bookList = Future<List<dynamic>>.value([]);

class GenreButton extends StatelessWidget {
  String _caption;
  Color _color;
  GenreButton(this._caption, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.all(5),
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

class ButtonRow extends StatelessWidget {
  String _caption1, _caption2;
  ButtonRow(this._caption1, this._caption2);

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Row(
                  children: [
                    Text(
                      'Based on what you like :',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: fontColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          var favoriteTitle =
                              'Harry Potter and the half blood prince';
                          if (favoriteList.isNotEmpty) {
                            favoriteTitle = favoriteList.last;
                          }

                          bookList = userRecommendationList(favoriteTitle);
                          bookCount = 6;
                        });
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: ListView.builder(
              itemCount: bookCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: bookList,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Umm I guess something went wrong. Restarting the app might work?',
                      );
                    } else {
                      return BookTile(
                        Book(
                          snapshot.data[index].toString(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
            children: [
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
