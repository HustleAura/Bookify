import 'package:bookify/utils/constants.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// function for building the UI of the bottom navigation bar
List<BottomNavigationBarItem> buildNavBarList(List<IconData> itemList) {
  List<BottomNavigationBarItem> navBarItemList = [];
  itemList.forEach(
    (element) {
      navBarItemList.add(
        BottomNavigationBarItem(
          label: '•',
          icon: Icon(
            element,
            color: inactiveColor,
          ),
          activeIcon: Icon(
            element,
            color: primaryColor,
          ),
        ),
      );
    },
  );
  return navBarItemList;
}

// general function to call the api and fetch data
Future<dynamic> apiCall({apiLink, bookTitle, header}) async {
  final dio = Dio();

  var jsonResponse = await dio.post(
    apiLink,
    data: FormData.fromMap(
      {'book_title': bookTitle},
    ),
  );

  return await jsonResponse.data[header];
}

// specific function to convert api response to usable formats

// image cover
String apiCallToImageUrl(String responseData) {
  var imageUrl = '';
  int start = 0;
  for (var i = 0; i < responseData.length; i++) {
    if (responseData[i] == 'h') {
      start = i;
      break;
    }
  }
  for (var i = start; i < responseData.length; i++) {
    if (responseData[i] != '\\') imageUrl += responseData[i];
  }

  return imageUrl;
}

// search recommendation list
Future<List<dynamic>> searchRecommendationList(searchTitle) async {
  return await apiCall(
    apiLink: searchRecommendationApi,
    bookTitle: searchTitle,
    header: 'recommended_books',
  );
}

// user recommendation list
Future<List<dynamic>> userRecommendationList(favoriteTitle) async {
  return await apiCall(
    apiLink: userRecommendationApi,
    bookTitle: favoriteTitle,
    header: 'recommended_books',
  );
}
