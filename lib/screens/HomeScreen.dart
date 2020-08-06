import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:karyasmk/models/ProductModel.dart';
import 'package:karyasmk/widgets/CardItem.dart';
import 'package:karyasmk/models/MenuModel.dart';
import 'package:neumorphic/neumorphic.dart';

class HomeScreen extends StatelessWidget {
  final menuItems = [
    MenuModel("Software", "assets/images/wireframe.png"),
    MenuModel("Electronic", "assets/images/circuit.png"),
    MenuModel("Handycraft", "assets/images/crayon.png"),
    MenuModel("Multimedia", "assets/images/multimedia.png"),
    MenuModel("Others", "assets/images/box.png"),
  ];

  final productItems = [
    ProductModel.listCard(
        "182t1g9f8hqw", "Kardus Pizza\n", "assets/images/kardus.jpeg", 1000),
    ProductModel.listCard("182t1g9f8hqw", "Lampu Flip Flop awe awe awe",
        "assets/images/flip.jpg", 1000),
    ProductModel.listCard(
        "182t1g9f8hqw", "Sepeda Listrik", "assets/images/sepeda.jpg", 1000),
    ProductModel.listCard(
        "182t1g9f8hqw", "Lampu Flip Flop", "assets/images/circuit.png", 1000),
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
      curveType: CurveType.emboss,
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
                style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
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

  Widget productGrid(double itemWidth, double itemHeight) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 0.0, //samping
      mainAxisSpacing: 10.0, //atas
      childAspectRatio: (itemWidth / itemHeight),
      controller: new ScrollController(keepScrollOffset: false),
      scrollDirection: Axis.vertical,
      children: productItems
          .map((data) => CardItem(
                idProduct: data.idProduct,
                title: data.title,
                image: data.image,
                price: data.price,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) + 50;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: NeuTheme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  header(context),
                  SizedBox(
                    height: 15,
                  ),
                  menuGrid(),
                  Divider(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      print('Pressed !');
                    },
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(
                        'assets/images/poster1.png',
                      ),
                    ),
                  ),
                  productGrid(itemWidth, itemHeight),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
