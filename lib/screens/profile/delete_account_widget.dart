import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/utils/toast_utils.dart';
import 'package:flutter/material.dart';

class DeleteAccountItem extends StatelessWidget {
  _showWarningToast(){
    ToastUtils.warning('Para deletar a sua conta dê duplo(2) click.');
  }

  @override
  Widget build(BuildContext context) {

    __submitDelete(){
      print('delete account trigged!');
      FirebaseService.deleteAccount()
      .then((result) => Navigator.pop(context))
      .catchError((error) => ToastUtils.showError('Não foi possível concluir a sua solicitação. Erro $error.code : $error.message'));
      
    }

    Future<void> _deleteAccount() async{//TODO: Refatorar. Usar utils e retornar boolean
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
          title: Text('Apagar a conta'),
          content: Text('Esta operação irá deletar seus dados e suas publicações do DoE completamente. Tem certeza que deseja continuar ?'),
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
                    __submitDelete();
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
      onTap: _showWarningToast,
      onDoubleTap: _deleteAccount,
          child: Container(
              margin: EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.red
              ),
              child: Text(
                'Apagar conta',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}