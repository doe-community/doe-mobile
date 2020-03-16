import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.home, size: 35.0, color: Theme.of(context).primaryColor,),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dados pessoais',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.0,),
                    Text(
                      'Cidade, País, Contato...',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}