import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:flutter/material.dart';

class Book {
  String bookName;
  late FutureBuilder bookCover;

  Book(this.bookName) {
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
