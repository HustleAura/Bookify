import 'package:flutter/material.dart';
import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';

class Book {
  String bookName;
  late FutureBuilder bookCover;

  Book(this.bookName) {
    // the book cover image can be then fetched from the api if name is known
    bookCover = FutureBuilder(
      future: apiCall(
        apiLink: imageUrlApi,
        header: 'image_url',
        bookTitle: bookName,
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Stack(
            alignment: Alignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text(
            'Umm I guess something went wrong. Restarting the app might work?',
          );
        } else {
          return Image.network(
            apiCallToImageUrl(snapshot.data),
            fit: BoxFit.fill,
          );
        }
      },
    );
  }
}
