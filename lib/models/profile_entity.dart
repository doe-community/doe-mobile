import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/base_entity.dart';

class ProfileEntity extends BaseEntity{
  String email;//user id is user email
  String displayName;
  String city;
  String country;
  Timestamp lastUpdate;


  ProfileEntity.fromJson(Map<String, dynamic> json)
    : this.email = json['email'],
      this.displayName = json['display_name'],
      this.city = json['city'],
      this.country = json['country'],
      this.lastUpdate = json['last_update']
      ;


  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': this.email,
    'display_name': this.displayName,
    'city': this.city,
    'coutry': this.country,
    'last_update': this.lastUpdate,
  };

}