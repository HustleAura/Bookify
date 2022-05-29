import 'bookModel.dart';

class AppUser {
  String _email, _password;
  List<Book> _favoriteBooks = [];

  AppUser(this._email, this._password);
  String get email => _email;
  String get password => _password;
}
