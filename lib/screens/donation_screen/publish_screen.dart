import 'dart:io';

import 'package:doe/models/donate_entity.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:doe/services/firebase_storage_service.dart';
import 'package:doe/utils/toast_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PublishFormScreen extends StatefulWidget {
  final File image;
  final Donate donation;

  const PublishFormScreen({this.donation, this.image});

  @override
  _PublishFormScreenState createState() => _PublishFormScreenState();
}

class _PublishFormScreenState extends State<PublishFormScreen> {
  StorageUploadTask _uploadTask;

  @override
  initState(){
    super.initState();
    _publish();
  }

  _publish() async{
    
    String filePath = widget.donation.imageUrl;
    print('uploading donation image $filePath into firebase storage.');

    var ref = FirebaseStorageService.getInstance().ref().child(filePath);

    setState(() {
      _uploadTask =  ref.putFile(widget.image); 
    });
    

  } 

  _submit() async{
    try {
     var downloadPath = await FirebaseStorageService.getInstance().ref().child(widget.donation.imageUrl).getDownloadURL();
     print('image download path $downloadPath');
      print('saving donation in database');
      widget.donation.imageUrl = downloadPath;
       FireBaseDatabaseServiceImpl()
            .save(collection: 'donations/items/all', data: widget.donation)
            .then((_){
              print('donation $widget.donation saved!');
              ToastUtils.showSuccess('Doação publicado com sucesso!');
              Navigator.pop(context);
            })
            .catchError((error) => print(error));
    } catch (error) {
      print('error saving donation in database. $error.code: $error.message');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if(_uploadTask != null){
      return StreamBuilder<StorageTaskEvent>(
        stream: _uploadTask.events,
        builder: (context, snapshot){
          var event = snapshot?.data?.snapshot;
          double progressPercent = event != null
              ? event.bytesTransferred / event.totalByteCount : 0;
          print('Porcentage: $progressPercent');
          if(progressPercent == 1.0){
            _submit();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).accentColor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                value: progressPercent,
              ),
            ),
          );
        }
      );
    }else{
      return FlatButton.icon(
        onPressed: _publish, 
        icon: Icon(Icons.cloud_upload),
        label: Text('Tente novamente.'),
      );
    }
  }
}