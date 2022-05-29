import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:bookify/widgets/likeButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/models/bookModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LikedBook extends StatelessWidget {
  Book _book;
  LikedBook(this._book);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: Container(
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
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
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
    );
  }
}
