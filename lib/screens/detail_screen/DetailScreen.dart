import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/ImageViewWrapper.dart';
import 'package:karyasmk/widgets/QtyCounter.dart';
import 'package:neumorphic/neumorphic.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  num _counter = 0;
  num _defaultValue = 1;

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
      backgroundColor: NeuTheme.of(ctx).backgroundColor,
      elevation: 0,
      leading: IconButton(
        iconSize: 27,
        color: Colors.black,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(ctx, true);
        },
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 27,
          color: Colors.black,
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 27,
          color: Colors.black,
          icon: Icon(Icons.star_border),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget headerText(Size size) {
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
              fontFamily: 'Roboto',
              color: HexColor('#585858'),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget displayImage(BuildContext ctx, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => const ImageViewWrapper(
              backgroundDecoration: BoxDecoration(color: Colors.white),
              imageProvider: AssetImage("assets/images/sepeda.jpg"),
            ),
          ),
        );
      },
      child: Container(
        width: size.width,
        height: 200,
        child: Image.asset(
          'assets/images/sepeda.jpg',
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          QtyCounter(
            initialValue: _defaultValue,
            minValue: 0,
            maxValue: 10,
            step: 1,
            buttonSize: 40,
            color: NeuTheme.of(context).backgroundColor,
            textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 20),
            decimalPlaces: 0,
            onChanged: (value) {
              setState(() {
                _defaultValue = value;
                _counter = value;
              });
            },
          ),
          Text(
            'Rp115.100.000',
            style: TextStyle(
              wordSpacing: 15,
              fontSize: 23,
              fontFamily: 'Montserrat-bold',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: NeuTheme.of(context).backgroundColor,
        appBar: customAppBar(context),
        body: SingleChildScrollView(
            child: DefaultTextStyle(
          style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
          child: Container(
              child: Column(
            children: <Widget>[
              headerText(size),
              displayImage(context, size),
              description(),
            ],
          )),
        )));
  }
}
