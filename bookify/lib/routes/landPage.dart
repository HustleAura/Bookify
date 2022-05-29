import 'package:bookify/routes/screens/favoritePage.dart';
import 'package:bookify/routes/screens/homePage.dart';
import 'package:bookify/routes/screens/libraryPage.dart';
import 'package:bookify/routes/screens/profilePage.dart';
import 'package:bookify/utils/constants.dart';
import 'package:bookify/utils/functions.dart';
import 'package:flutter/material.dart';

class LandPage extends StatefulWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  State<LandPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  PageController _pageController = PageController();

  int _currentIndex = 0;
  void _updatePage(int index) {
    setState(() {
      _pageController.jumpToPage(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 0,
        onTap: _updatePage,
        items: buildNavBarList(
          [
            Icons.home,
            Icons.favorite,
            Icons.book,
            Icons.person,
          ],
        ),
      ),
      body: PageView(
        onPageChanged: _updatePage,
        controller: _pageController,
        children: [
          HomePage(),
          FavoritePage(),
          LibraryPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
