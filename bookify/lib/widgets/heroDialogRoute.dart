import 'package:flutter/material.dart';

// class for pop up animation in book interface
class HeroDialogRoute extends PageRoute {
  final WidgetBuilder _builder;
  HeroDialogRoute(this._builder);

  @override
  Color get barrierColor => Colors.black45;

  @override
  String? get barrierLabel => 'Book open';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;
}
