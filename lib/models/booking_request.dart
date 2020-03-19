import 'package:doe/models/base_entity.dart';
import 'package:flutter/cupertino.dart';

class BookingRequest extends BaseEntity{
  final String owner;
  final String requester;
  final String postId;

  BookingRequest({@required this.owner, @required this.requester, @required this.postId});

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'owner': this.owner,
    'requester': this.requester,
    'postId': this.postId,
  };

}