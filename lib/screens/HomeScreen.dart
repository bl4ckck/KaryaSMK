import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:karyasmk/models/MenuModel.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class HomeScreen extends StatelessWidget {
  final menuItems = [
    MenuModel("Software", "assets/images/wireframe.png"),
    MenuModel("Electronic", "assets/images/circuit.png"),
    MenuModel("Handycraft", "assets/images/crayon.png"),
    MenuModel("Multimedia", "assets/images/multimedia.png"),
    MenuModel("Others", "assets/images/box.png"),
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
                    'Karya SMK',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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

  Widget itemGrid(String title, String imagePath) {
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
                imagePath,
                height: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
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
      padding: EdgeInsets.all(19.0),
      crossAxisSpacing: 15.0, //samping
      mainAxisSpacing: 25.0, //atas
      children:
          menuItems.map((data) => itemGrid(data.title, data.image)).toList(),
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
                itemGrid('title', 'assets/images/box.png'),
                SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}
