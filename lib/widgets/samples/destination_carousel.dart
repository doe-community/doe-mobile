import 'package:doe/models/samples/destination_model.dart';
import 'package:doe/screens/destination_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Top cities',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print('See All');
                      },
                      child: Text(
                        'Ver mais',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                           letterSpacing: 1.0,
                           decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230.0,
                child: ListView.builder(
                  itemCount: destinations.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    Destination destination = destinations[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          CupertinoPageRoute(
                            builder: (_) => DestinationScreen(destination: destination,)));
                      },
                      child: Container(
                        margin: EdgeInsets.all(1.0),
                        width: 160.0,
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              //bottom: 15.0,
                              child: Container(
                                height: 230.0,
                                width: 155.0,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${destination.description}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                )],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag: destination.imageUrl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 150.0,  
                                          width: 150.0,
                                          image: AssetImage(destination.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          destination.city,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.locationArrow, 
                                              size: 10.0, 
                                              color: Colors.white,),
                                            Text(
                                              destination.country,
                                              style: TextStyle(
                                                color: Colors.white,
                                                
                                              ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } ),
              )
            ],
          );
  }
}