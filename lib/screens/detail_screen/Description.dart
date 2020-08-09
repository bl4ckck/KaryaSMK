import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/QtyCounter.dart';
import 'package:neumorphic/neumorphic.dart';

class Description extends StatefulWidget {
  const Description({Key key}) : super(key: key);

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
        QtyCounter(
          initialValue: defaultValue,
          minValue: 1,
          maxValue: 10,
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
        Text(
          'Rp115.100.000',
          style: TextStyle(
            wordSpacing: 15,
            fontSize: 23,
            color: HexColor('#2f2f2f'),
            fontFamily: 'Montserrat-bold',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          topItem(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 25),
            child: Text(
              'Stok Barang: 50 pcs',
              style: TextStyle(
                  fontSize: 16,
                  color: HexColor('#ffa554'),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Et duo diam ea aliquyam duo consetetur magna dolor aliquyam ipsum, est accusam est accusam lorem dolore, eirmod sit erat dolor invidunt takimata. Sanctus sed dolor ea dolor lorem erat dolor. Consetetur vero dolores sed justo rebum sea sed vero amet. Et sit sanctus dolor voluptua sit erat no labore. Voluptua kasd labore takimata diam diam clita, eos et aliquyam tempor sed sit nonumy. Aliquyam kasd dolores magna justo, amet eos dolor takimata labore accusam dolor et elitr, clita et voluptua vero voluptua. Dolor ut stet rebum elitr dolore, consetetur justo sed nonumy vero et sea rebum, elitr dolor eirmod. awd awd awd ',
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
