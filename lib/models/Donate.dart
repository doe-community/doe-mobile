import 'package:doe/models/User.dart';
import 'package:doe/models/base_entity.dart';


 /// The donate object representing each donation published

class Donate implements BaseEntity{
  int id;
  String title;
  String address;
  String city;
  List<String> images;
  DateTime date;
  User user;
  String additionalInfo;

  Donate({ 
    this.title, 
    this.address, 
    this.city, 
    this.images, 
    this.date, 
    this.user, 
    this.additionalInfo,
  });

  /// TODO: check https://flutter.dev/docs/development/data-and-backend/json fr further implementation (code generation)
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': this.title,
    'address': this.address,
    'city': this.city,
    'images': this.images,
    'date': this.date,
    'user': user.email,
    'additional_info': this.additionalInfo,
  };

}