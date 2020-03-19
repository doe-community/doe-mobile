import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:doe/utils/alert_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


class MessageService {
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  final FirebaseDatabaseService databaseService;
  final FirebaseUser user;

  MessageService({this.user, this.databaseService,});



  setupCloudMessaging() async{

    var result = await databaseService.getUserDeviceToken(user.email);
    if(result != null){//already has token associated
     // return ;
    }
    
    //configure fcm permission to work in IOS
    if(Platform.isIOS){
     // iosSubscription = 
      _fcm.onIosSettingsRegistered.listen((data) => _saveDeviceToken());
      _fcm.requestNotificationPermissions(
        IosNotificationSettings(),
      );
    }else{
      _saveDeviceToken();
    }
  }

  setupNotificationHandler(BuildContext context){
      _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("on message: $message");
        AlertUtils.show(context, message['notification']['title'], message['notification']['body']);
      },

      onResume: (Map<String, dynamic> message) async {
        print("on resume: $message");
        AlertUtils.show(context, message['notification']['title'], message['notification']['body']);
      },

      onLaunch: (Map<String, dynamic> message) async {
        print("on lauch: $message");
        AlertUtils.show(context, message['notification']['title'], message['notification']['body']);
      },
    );
  }

  registerTopic(String topic){
    _fcm.subscribeToTopic(topic);
  }

  unsubscribeTopic(String topic){
    _fcm.unsubscribeFromTopic(topic);
  }

    //Get the token, save it to the database for current user
  _saveDeviceToken() async {

    String fcmToken = await _fcm.getToken();

    if(fcmToken != null){
      var tokenRef = _db.collection('profiles')
      .document(user.email)
      .collection('tokens')
      .document(fcmToken);

      tokenRef.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),
        'platforma': Platform.operatingSystem,
      });

    }

  }
  
}