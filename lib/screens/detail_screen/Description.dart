import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class Description extends StatelessWidget {
  final String desc;
  final Widget topItem;
  final num qty;

  const Description(
      {Key key,
      @required this.desc,
      @required this.topItem,
      @required this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          topItem,
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25),
            child: Text(
              "Stok Barang: " + qty.toString() + " pcs",
              style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#ffa554'),
                  fontWeight: FontWeight.bold),
            ),
          ),
          ExpandText(
            desc,
            expandOnGesture: false,
            style: TextStyle(
                wordSpacing: 3,
                height: 2,
                fontSize: 14,
                color: HexColor('#4d4d4d'),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
