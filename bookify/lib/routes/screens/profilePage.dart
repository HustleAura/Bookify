import 'package:bookify/utils/constants.dart';
import 'package:bookify/widgets/statsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/services/authenticationService.dart';

class PageButton extends StatelessWidget {
  String _caption;
  Color _color, _fontColor;
  VoidCallback _onPressed;
  PageButton(this._caption, this._color, this._fontColor, this._onPressed);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text(
          _caption,
          style: GoogleFonts.kanit(
            color: _fontColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_color),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(_width * 0.9, _height * 0.08),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: _width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue.shade500,
                  secondaryColor,
                  primaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Text(
                    'A reader lives a thousand lives before he dies '
                    '. . . The man who never reads lives only one.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        ' - George R.R. Martin',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: _width,
            child: Row(
              children: [
                StatsCard(1854, 'Books'),
                StatsCard(217314, 'Ratings'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: PageButton(
            'GET PREMIUM 👑 ',
            primaryColor,
            Colors.white,
            () {},
          ),
        ),
        Expanded(
          flex: 1,
          child: PageButton(
            'LOG OUT',
            Colors.grey.shade300,
            fontColor,
            () {
              Provider.of<AuthenticationService>(
                context,
                listen: false,
              ).SignOut();
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'For the ❤ of reading, by Manjeet Pani',
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
