import 'package:doe/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class LogoutItem extends StatelessWidget {
    final VoidCallback onSignedOut;

  const LogoutItem({  this.onSignedOut  });

  @override
  Widget build(BuildContext context) {


  void _signOut() async {
    try {
      var currentUser = await FirebaseService.currentUser();
      print('user $currentUser.email request signout');
      FirebaseService.signout();
      onSignedOut();
      Navigator.pop(context);
    } catch (e) {
      print(e.message);
    }
  }
  
  _showAlertDialog(){//TODO: Refatorar. Adicionar oa utils e retornar boolean
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
        title: Text('Sair'),
        content: Text('Deseja realmente sair ?'),
        actions: <Widget>[
          Row(
            children: <Widget>[              
              FlatButton(
                onPressed: () => Navigator.pop(context), 
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed:(){
                  Navigator.pop(context);
                  _signOut();
                }, 
                child: Text('Confirmar'),
              ),
            ],
          ),
        ],
      );
     }
    );
  }

    return GestureDetector(
      onTap: _showAlertDialog,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app, size: 35.0, color: Theme.of(context).primaryColor,),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sair',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}