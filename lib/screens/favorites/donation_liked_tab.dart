import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/Donate.dart';
import 'package:doe/screens/categories/post_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationLikedTab extends StatefulWidget {
  final String userId;

  const DonationLikedTab({ this.userId });

  @override
  _DonationLikedTabState createState() => _DonationLikedTabState();
}

class _DonationLikedTabState extends State<DonationLikedTab> {

  _handleView(Donate _post){
    print(_post.toJson());
    Navigator.push(context, CupertinoPageRoute(builder: (_) => PostViewScreen(post: _post,)));
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('donations')
      .where('user', isEqualTo: widget.userId)
      .orderBy('date', descending: true)
      .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return CircularProgressIndicator(
            value: 80,
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
    );
  }
}