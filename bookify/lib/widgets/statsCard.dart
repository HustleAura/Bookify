import 'package:bookify/utils/constants.dart';

import 'package:flutter/material.dart';

// stats card for displaying dataset statistics in the profile page UI
class StatsCard extends StatefulWidget {
  final int _count;
  final String _caption;
  const StatsCard(this._count, this._caption);

  @override
  State<StatsCard> createState() => _StatsCardState(_count, _caption);
}

class _StatsCardState extends State<StatsCard> {
  final int _count;
  final String _caption;
  _StatsCardState(this._count, this._caption);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 45,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      _count.toString(),
                      style: TextStyle(
                        color: fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _caption,
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
