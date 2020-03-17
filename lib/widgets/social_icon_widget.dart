import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPress;

  const SocialIcon({this.colors, this.iconData, this.onPress});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            tileMode: TileMode.clamp,
          ),
        ),
        child: RawMaterialButton(
          onPressed: onPress,
          shape: CircleBorder(),
          child: Icon(iconData, color: Colors.white,),
         ),
      ),
    );
  }
}
