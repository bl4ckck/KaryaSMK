import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const MenuItem({Key key, @required this.title, @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.emboss,
      bevel: 12,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: NeuButton(
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.zero),
        onPressed: () {
          print('Pressed !');
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              imagePath,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
