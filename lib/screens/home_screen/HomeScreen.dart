import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:karyasmk/models/ProductModel.dart';
import 'package:karyasmk/screens/home_screen/TerbaruList.dart';
import 'package:karyasmk/models/MenuModel.dart';
import 'package:neumorphic/neumorphic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Widget header() {
    return SafeArea(
      top: true,
      child: Container(
        margin: EdgeInsets.only(top: 45, bottom: 10, left: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 25.0,
        crossAxisSpacing: 15.0,
      ),
      padding: EdgeInsets.all(19.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (BuildContext context, int index) {
        return itemGrid(
          menuItems[index].title,
          menuItems[index].image,
        );
      },
    );
  }

  ProductListBloc _productListBloc;

  @override
  void initState() {
    super.initState();
    init();
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
                  header(),
                  menuGrid(),
                  Divider(
                    height: 25,
                  ),
                  Container(
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        'Popular Product',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Montserrat-bold'),
                      )),
                  TerbaruList(
                    itemHeight: itemHeight,
                    itemWidth: itemWidth,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void init() {
    _productListBloc = BlocProvider.of(context)
      ..add(InitialFetchProductEvent());
  }
}
