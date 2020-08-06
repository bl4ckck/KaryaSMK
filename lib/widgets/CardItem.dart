import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:neumorphic/neumorphic.dart';

class CardItem extends StatelessWidget {
  final String idProduct;
  final String title;
  final String image;
  final String price;

  const CardItem(
      {Key key,
      @required this.idProduct,
      @required this.title,
      @required this.image,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int priceInt = int.parse(price);

    var fPrice = NumberFormat.currency(name: 'Rp').format(priceInt);

    return NeuCard(
      curveType: CurveType.concave,
      bevel: 12,
      margin: EdgeInsets.all(15), //15
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: NeuButton(
        padding: EdgeInsets.zero,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.zero),
        onPressed: () {
          print('Pressed !');
        },
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 18),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        wordSpacing: 3,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Text(
                    '$fPrice',
                    style: TextStyle(
                      wordSpacing: 3,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#474747'),
                      fontFamily: 'Montserrat-bold',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
