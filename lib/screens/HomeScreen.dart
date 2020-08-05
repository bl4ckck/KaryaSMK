import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:rekat/models/MenuModel.dart';
import 'package:rekat/widgets/HexColor.dart';

class HomeScreen extends StatelessWidget {
  final menuItems = [
    MenuModel("menu 1", "img1"),
    MenuModel("menu 2", "img1"),
    MenuModel("menu 3", "img1"),
    MenuModel("menu 1", "img1"),
    MenuModel("menu 2", "img1"),
    MenuModel("menu 3", "img1"),
  ];

  Widget header(BuildContext ctx) {
    return SafeArea(
      top: true,
      child: Container(
        // color: Colors.red,
        // width: MediaQuery.of(ctx).size.width,
        margin: EdgeInsets.only(top: 45, left: 15),
        alignment: Alignment.topLeft,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello, Awe!',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rekat',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            NeuCard(
              curveType: CurveType.emboss,
              decoration:
                  NeumorphicDecoration(borderRadius: BorderRadius.circular(38)),
              child: NeuButton(
                onPressed: () {
                  print('Pressed !');
                },
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemGrid(String title) {
    return NeuCard(
      curveType: CurveType.convex,
      bevel: 12,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: Wrap(children: <Widget>[
        NeuButton(
          decoration: NeumorphicDecoration(borderRadius: BorderRadius.zero),
          onPressed: () {
            print('Pressed !');
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/box.png',
                height: 50,
              ),
              Text(title),
            ],
          ),
        ),
      ]),
    );
  }

  Widget menuGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      padding: EdgeInsets.all(20.0),
      crossAxisSpacing: 15.0, //samping
      mainAxisSpacing: 25.0, //atas
      children: menuItems.map((data) => itemGrid(data.title)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeuTheme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                header(context),
                SizedBox(
                  height: 30,
                ),
                menuGrid(),
                SizedBox(
                  height: 30,
                ),
                itemGrid('title'),
                SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}
