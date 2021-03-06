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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          size: 30,
        ),
        onPressed: () {
          refresh();
        },
      ),
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
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'All Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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

  void init() async {
    _productListBloc = BlocProvider.of<ProductListBloc>(context);
    _productListBloc.add(InitialFetchProductEvent());
  }

  void refresh() async {
    _productListBloc = BlocProvider.of<ProductListBloc>(context);
    _productListBloc.add(FetchProductEvent());
  }
}
