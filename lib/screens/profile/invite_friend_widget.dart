import 'package:flutter/material.dart';

class InviteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.people, size: 35.0, color: Theme.of(context).primaryColor,),
                SizedBox(width: 20.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Convide sues amigos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.0,),
                      Text(
                        'Convide seus amigos para fazeren parte da famĩlia DoE. Ajude e seja ajudado.',
                        style: TextStyle(
                          color: Colors.grey,
                          
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}