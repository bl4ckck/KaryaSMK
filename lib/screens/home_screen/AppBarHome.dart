import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        margin: EdgeInsets.only(top: 45, bottom: 10, left: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello, Awe!',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Karya SMK',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            NeuCard(
              curveType: CurveType.emboss,
              decoration:
                  NeumorphicDecoration(borderRadius: BorderRadius.circular(38)),
              child: NeuButton(
                onPressed: () {
                  print('Pressed !');
                },
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
