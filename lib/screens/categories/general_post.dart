import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/Donate.dart';
import 'package:doe/services/firebase_database_service.dart';
import 'package:flutter/material.dart';

class GeneralPostScreen extends StatefulWidget {
  final FirebaseDatabaseService databaseService;
  final String category;

  const GeneralPostScreen({this.databaseService, this.category});

  @override
  _GeneralPostScreenState createState() => _GeneralPostScreenState();
}

class _GeneralPostScreenState extends State<GeneralPostScreen> {

  List<Donate> posts = [];
  int controller = 0;

  _handleView(Donate post){
    print(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.black12,
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[
          
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('donations').orderBy('date').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                Donate post = Donate.fromJson(document.data);
                return GestureDetector(
                  onTap: () => _handleView,
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
                            image: post.imageUrl == null ? AssetImage('assets/images/hotel2.jpg') : NetworkImage(post.imageUrl),
                            fit: BoxFit.cover, 
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              post.title
                            ),
                            Text(
                              post.city
                            ),
                            Text(
                              '${post.date.toDate()}'
                            ),
                            

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



      //backgroundColor: Theme.of(context).primaryColor,
      /*body: ListView.builder(
        //itemCount: posts.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => _handleView(index),
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(5.0),
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: Text(
                'Hola $index'
              ),
            ),
          );
        }),*/
    );
  }
}