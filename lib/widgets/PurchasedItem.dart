import 'package:flutter/material.dart';
import 'package:karyasmk/helper/currencyFormat.dart';
import 'package:neumorphic/neumorphic.dart';

class PurchasedItem extends StatelessWidget {
  const PurchasedItem(
      {Key key,
      @required this.title,
      @required this.date,
      @required this.item,
      @required this.price})
      : super(key: key);
  final String title, date;
  final num item, price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: NeuTheme.of(context).backgroundColor,
        child: ListTile(
          isThreeLine: true,
          title: Text(title),
          trailing: Text('$item Item(s)'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  date,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Text(
                  currencyFormat(price),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
