import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:neumorphic/neumorphic.dart';

import 'detail_screen.dart';

class DetailScreen extends StatelessWidget {
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

  Widget custBottomBar() {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 45,
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FloatingActionButton.extended(
            elevation: 4.0,
            backgroundColor: HexColor('#ffa451'),
            label: Text('Pesan Sekarang'),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: custBottomBar(),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          children: <Widget>[
            HeaderText(size: size),
            DisplayImage(size: size),
            Description(),
          ],
        ))));
  }
}
