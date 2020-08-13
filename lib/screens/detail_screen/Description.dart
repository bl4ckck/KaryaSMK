import 'package:auto_size_text/auto_size_text.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/helper/currencyFormat.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/QtyCounter.dart';
import 'package:neumorphic/neumorphic.dart';

class Description extends StatefulWidget {
  final String desc;
  final num qty, price;

  const Description(
      {Key key, @required this.desc, @required this.qty, @required this.price})
      : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  num counter = 0;
  num defaultValue = 1;

  Widget topItem() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: QtyCounter(
            initialValue: defaultValue,
            minValue: 1,
            maxValue: widget.qty,
            step: 1,
            buttonSize: 40,
            color: NeuTheme.of(context).backgroundColor,
            textStyle: TextStyle(fontSize: 20),
            decimalPlaces: 0,
            onChanged: (value) {
              setState(() {
                defaultValue = value;
                counter = value;
              });
            },
          ),
        ),
        Expanded(
          child: AutoSizeText(
            currencyFormat(widget.price),
            maxLines: 1,
            style: TextStyle(
              wordSpacing: 15,
              fontSize: 23,
              color: HexColor('#2f2f2f'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          topItem(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25),
            child: Text(
              "Stok Barang: " + widget.qty.toString() + " pcs",
              style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#ffa554'),
                  fontWeight: FontWeight.bold),
            ),
          ),
          ExpandText(
            widget.desc,
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
