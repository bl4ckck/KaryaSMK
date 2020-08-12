import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:neumorphic/neumorphic.dart';
import 'home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  AppBarHome(),
                  MenuList(),
                  Divider(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'All Products',
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
