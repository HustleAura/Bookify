import 'package:bookify/utils/functions.dart';
import 'package:bookify/widgets/bookTile.dart';
import 'package:bookify/widgets/textFieldContainer.dart';
import 'package:flutter/material.dart';

import '../../utils/models/bookModel.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _bookCount = 0;
  final _controller = TextEditingController();
  Future<List<dynamic>> _bookList = Future<List<dynamic>>.value([]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: TextFieldContainer(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Explore our collection : ',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    onSubmitted: (searchTitle) {
                      setState(() {
                        _bookList = searchRecommendationList(searchTitle);
                        _bookCount = 18;
                      });
                    },
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: _bookCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: _bookList,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Umm I guess something went wrong. Restarting the app might work?',
                      );
                    } else {
                      return BookTile(
                        Book(
                          snapshot.data[index].toString(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
