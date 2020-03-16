import 'package:flutter/material.dart';

class HelpItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.help, size: 35.0, color: Theme.of(context).primaryColor,),
                SizedBox(width: 20.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Ajuda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.0,),
                      Text(
                        'FAQ, contacte-nos, Termos e Políticas de Privacidade, Informação de Applicativo ...',
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