import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class InviteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<void>_share() async{
      await FlutterShare.share(
        title: 'Venha fazer parte da família DoE.',
        text: 'Com DoE você pode doar e também receber coisas que você precisa. É simples, fácil e melhor de tudo, é de graça 😍. Baixe agora!',
        linkUrl: 'https://flutter.dev/'
        );
    }

    return GestureDetector(
      onTap: _share,
          child: Container(
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
                          'Convide seus amigos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text(
                          'Convide seus amigos para fazerem parte da famĩlia DoE. Ajude e seja ajudado.',
                          style: TextStyle(
                            color: Colors.grey,
                            
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}