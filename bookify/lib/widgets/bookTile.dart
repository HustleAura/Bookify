import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/bookInterface.dart';
import 'package:bookify/utils/models/bookModel.dart';
import 'package:bookify/widgets/heroDialogRoute.dart';

import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final Book _book;
  const BookTile(this._book);

  @override
  State<BookTile> createState() => _BookTileState(_book);
}

// Book tile for showing books in recommendations
class _BookTileState extends State<BookTile> {
  final Book _book;
  _BookTileState(this._book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            (context) {
              return BookInterface(_book.bookName);
            },
          ),
        );
      },
      child: Hero(
        tag: _book.bookName,
        child: Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 133,
                width: 95,
                child: _book.bookCover,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 1,
                  vertical: 4,
                ),
                child: Text(
                  _book.bookName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
