import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:bookify/widgets/likeButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookInterface extends StatefulWidget {
  final String _bookTitle;
  const BookInterface(this._bookTitle);

  @override
  State<BookInterface> createState() => _BookInterfaceState(_bookTitle);
}

// interface to view book details and adding to favorites
class _BookInterfaceState extends State<BookInterface> {
  final String _bookTitle;
  _BookInterfaceState(this._bookTitle);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _bookTitle,
      child: Center(
        child: SingleChildScrollView(
          child: Material(
            color: transparentColor,
            child: Column(
              children: [
                // book cover with animation
                FutureBuilder(
                  future: apiCall(
                    apiLink: imageUrlApi,
                    header: 'image_url',
                    bookTitle: _bookTitle,
                  ),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Umm I guess something went wrong. Restarting the app might work?',
                      );
                    } else {
                      return Image.network(
                        apiCallToImageUrl(snapshot.data),
                      );
                    }
                  },
                ),

                // rating bar and like button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ratingColor,
                        ),
                        onRatingUpdate: (rating) {},
                        itemSize: 30,
                        initialRating: 2.5,
                      ),
                      LikeButton(_bookTitle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
