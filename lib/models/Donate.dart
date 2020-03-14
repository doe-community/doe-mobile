import 'package:doe/models/base_entity.dart';


 /// The donate object representing each donation published

class Donate implements BaseEntity{
  String title;
  String city;
  String images;
  DateTime date;
  String user;
  String additionalInfo;

  Donate({ 
    this.title, 
    this.city, 
    this.images, 
    this.date, 
    this.user, 
    this.additionalInfo,
  });

  ///check https://flutter.dev/docs/development/data-and-backend/json fr further implementation (code generation)
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': this.title,
    'city': this.city,
    'images': this.images,
    'date': this.date,
    'user': user,
    'additional_info': this.additionalInfo,
  };

}