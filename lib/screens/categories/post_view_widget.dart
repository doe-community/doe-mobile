import 'package:doe/models/booking_request.dart';
import 'package:doe/models/donate_entity.dart';
import 'package:doe/services/firebase_auth_service.dart';
import 'package:doe/utils/toast_utils.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PostViewScreen extends StatefulWidget {
  final Donate post;

  const PostViewScreen({ this.post });

  @override
  _PostViewScreenState createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {

  String _baseUrl = 'https://us-central1-doei-b018d.cloudfunctions.net';

  _handleRequest() async{
    var currentUser = await FirebaseService.currentUser();
    if(currentUser.email == widget.post.user){
      ToastUtils.showError('Você não pode querer sua própria doação. 🤦🏿‍♂️');
    }else{
     print('User ${currentUser.email} requesting for donate.');
     //send push notification to post owner
     Map<String, String> headers = {"Content-type": "application/json"};
     var data = BookingRequest(owner: widget.post.user, requester: currentUser.email, postId: "lamine@gmail.com");
     var result = await http.post(_baseUrl+"/bookItem", body: data.toJson());
     print(result);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 0.0),
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0), 
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Image(
              image: NetworkImage(widget.post.imageUrl),
              fit: BoxFit.cover,
              
              ),
          ),
          SizedBox(height: 10.0,),
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  widget.post.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  widget.post.city,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  '${widget.post.date.toDate()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  widget.post.additionalInfo,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 150.0,
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.yellow,
                    onPressed: _handleRequest, 
                    child: Text(
                      'EU QUERO',
                    ),
                  ),
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}