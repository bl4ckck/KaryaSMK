import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class HeaderText extends StatelessWidget {
  final Size size;
  final String title;

  const HeaderText({Key key, @required this.title, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SMK Karya 1',
            maxLines: 2,
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 14,
            ),
          ),
          Divider(
            endIndent: (size.width / 2),
            thickness: 3,
            color: HexColor('#fa5d43'),
          ),
          Text(
            '$title',
            maxLines: 2,
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Montserrat-bold',
            ),
          ),
        ],
      ),
    );
  }
}
