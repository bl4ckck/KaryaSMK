import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karyasmk/screens/detail_screen/index_detail.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:neumorphic/neumorphic.dart';

class CardItem extends StatelessWidget {
  final String idProduct;
  final String title;
  final String image;
  final num price;

  const CardItem(
      {Key key,
      @required this.idProduct,
      @required this.title,
      @required this.image,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fPrice = NumberFormat.currency(name: 'Rp').format(price);

    return NeuCard(
      curveType: CurveType.concave,
      bevel: 12,
      margin: EdgeInsets.all(15),
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: NeuButton(
        padding: EdgeInsets.zero,
        decoration: NeumorphicDecoration(borderRadius: BorderRadius.zero),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new IndexDetail(
                endpoint: idProduct,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: Image.asset('assets/images/placeholder.jpg')),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
                      title + '\n',
                      maxLines: 2,
                      style: TextStyle(
                        wordSpacing: 3,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: HexColor('#585858'),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '$fPrice',
                    style: TextStyle(
                      wordSpacing: 3,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#fa5d43'),
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
