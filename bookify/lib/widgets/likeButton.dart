import 'package:bookify/routes/screens/favoritePage.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  String _bookTitle;
  LikeButton(this._bookTitle);

  @override
  State<LikeButton> createState() => _LikeButtonState(_bookTitle);
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;
  Color _iconColor = Colors.grey;
  String _bookTitle;
  _LikeButtonState(this._bookTitle);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _liked = !_liked;
          _iconColor = (_liked) ? Colors.red : Colors.grey;
          if (_liked)
            favoriteList.add(_bookTitle);
          else
            favoriteList.remove(_bookTitle);
        });
      },
      icon: Icon(
        Icons.favorite,
        color: _iconColor,
      ),
    );
  }
}
