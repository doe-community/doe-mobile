import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/donate_entity.dart';
import 'package:doe/screens/categories/post_view_widget.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralPostScreen extends StatefulWidget {
  final FirebaseDatabaseService databaseService;
  final String title;
  final String category;

  const GeneralPostScreen({this.databaseService, this.title, this.category});

  @override
  _GeneralPostScreenState createState() => _GeneralPostScreenState();
}

class _GeneralPostScreenState extends State<GeneralPostScreen> {

  _handleView(Donate _post){
    print(_post.toJson());
    Navigator.push(context, CupertinoPageRoute(builder: (_) => PostViewScreen(post: _post,)));
  }

  _getUserProfileInfo() async {
    var profile = await widget.databaseService.getDocument("profiles", "slamine@ppadtec.com.br");
    print('User profile ' + profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black12,
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.search, size: 30.0,),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.databaseService.getInstance().collection('donations').document('items').collection('all').orderBy('date', descending: true).snapshots(), //TODO: filter donations by category
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: 
            return Center(
              child: CircularProgressIndicator(
                value: 80,
              ),
            );
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  Donate post = Donate.fromJson(document.data);
                  return GestureDetector(
                    onTap: () => _handleView(post),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(5.0),
                      height: 120.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              width: 110.0,
                              image: post.imageUrl == null ? AssetImage('assets/images/profile.jpg') : NetworkImage(post.imageUrl),
                              fit: BoxFit.cover, 
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                post.title,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post.city,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${post.date.toDate()}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: 200.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                // color: Colors.amber,
                                ),
                                child: Text(
                                  '${post.additionalInfo}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                );
              }).toList(),
            );
          }
        },
        ),
   );
  }
}