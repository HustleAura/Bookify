import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/likedBook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/models/bookModel.dart';

List<String> favoriteList = [];

List<Widget> likedBooks = [
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
  LikedBook(
    Book(
      'Da Vinci Code',
    ),
  ),
];

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (BuildContext context, int index) {
                return LikedBook(
                  Book(
                    favoriteList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
