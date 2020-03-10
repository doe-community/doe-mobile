import 'package:doe/models/User.dart';

/**
 * The donate object representing each donation published
 */
class Donate {
  int id;
  String title;
  String address;
  String city;
  List<String> images;
  DateTime date;
  User user;
  String aditionalInfo;

  Donate({ this.title, this.address, this.city, this.images, this.date, this.user, this.aditionalInfo });
}