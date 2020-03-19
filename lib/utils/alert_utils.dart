import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertUtils {

  static void show(BuildContext context, String title, message){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          Center(
            child:            
              FlatButton(
                onPressed:(){
                  Navigator.pop(context);
                }, 
                child: Text('Confirmar'),
              ),
          ),
        ],
      );
     }
    );
  }
  
}