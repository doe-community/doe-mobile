import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/base_entity.dart';


 /// The donate object representing each donation published

class Donate implements BaseEntity{
  String title;
  String city;
  String imageUrl;
  Timestamp date;
  String user;
  String additionalInfo;

  Donate({ 
    this.title, 
    this.city, 
    this.imageUrl, 
    this.date, 
    this.user, 
    this.additionalInfo,
  });

  ///check https://flutter.dev/docs/development/data-and-backend/json fr further implementation (code generation)
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': this.title,
    'city': this.city,
    'images': this.imageUrl,
    'date': this.date,
    'user': user,
    'additional_info': this.additionalInfo,
  };

  Donate.fromJson(Map<String, dynamic> json)
  : this.title = json['title'],
    this.city = json['city'],
    this.imageUrl = json['images'],
    this.date = json['date'],
    this.user = json['user'],
    this.additionalInfo = json['additional_info']
    ;
}