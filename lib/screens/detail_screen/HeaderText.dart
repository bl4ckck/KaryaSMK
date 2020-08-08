import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class HeaderText extends StatelessWidget {
  final Size size;

  const HeaderText({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SMK Negeri 1 Kota Bekasi',
            maxLines: 2,
            style: TextStyle(
              wordSpacing: 3,
              fontSize: 14,
              fontFamily: 'Montserrat-bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            endIndent: (size.width / 2) + 50,
            thickness: 3,
            color: HexColor('#f7a194'),
          ),
          Text(
            'Sepeda Listrik Mars panjang',
            maxLines: 2,
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
