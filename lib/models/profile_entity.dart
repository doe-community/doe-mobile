import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/base_entity.dart';

class ProfileEntity extends BaseEntity{
  String userId;//user id is user email
  String city;
  String country;
  Timestamp lastUpdate;



  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'user_id': this.userId,
    'city': this.city,
    'coutry': this.country,
    'last_update': this.lastUpdate,
  };

}