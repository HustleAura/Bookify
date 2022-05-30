import 'heroDialogRoute.dart';
import 'package:flutter/material.dart';
import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/bookInterface.dart';
import 'package:bookify/utils/models/bookModel.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// liked book widget for showing liked books in the favorites page
class LikedBook extends StatelessWidget {
  final Book _book;
  const LikedBook(this._book);

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 15,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 150,
                  child: _book.bookCover,
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8,
                      ),
                      child: Text(
                        _book.bookName,
                        style: TextStyle(
                          fontSize: 20,
                          color: fontColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: RatingBar.builder(
                        initialRating: 0,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ratingColor,
                        ),
                        onRatingUpdate: (rating) {},
                        itemSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
