import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/helper/currencyFormat.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/screens/transaction_screen/index_add_transaction.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/QtyCounter.dart';
import 'package:neumorphic/neumorphic.dart';

import 'detail_screen.dart';

class DetailScreen extends StatefulWidget {
  final List<GetDataDetail> data;
  final String role, uid;

  const DetailScreen(
      {Key key, @required this.data, @required this.role, @required this.uid})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  num counter = 0;
  num defaultValue = 1;

  TransactionBloc _transactionBloc;

  void switchPage() async {
    _transactionBloc = BlocProvider.of<TransactionBloc>(context);
    _transactionBloc.add(StartPageTransactionEvent());
  }

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

  Widget topItem() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: QtyCounter(
            initialValue: (widget.data[0].quantity == 0) ? 0 : defaultValue,
            minValue: (widget.data[0].quantity == 0) ? 0 : 1,
            maxValue: widget.data[0].quantity,
            step: 1,
            buttonSize: 40,
            color: NeuTheme.of(context).backgroundColor,
            textStyle: TextStyle(fontSize: 20),
            decimalPlaces: 0,
            onChanged: (value) {
              setState(() {
                defaultValue = value;
                counter = value;
              });
              print(defaultValue);
            },
          ),
        ),
        Expanded(
          child: AutoSizeText(
            currencyFormat(widget.data[0].price),
            maxLines: 1,
            textAlign: TextAlign.right,
            style: TextStyle(
              wordSpacing: 15,
              fontSize: 23,
              color: HexColor('#2f2f2f'),
            ),
          ),
        ),
      ],
    );
  }

  Widget floatingButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: FloatingActionButton.extended(
        elevation: 4.0,
        backgroundColor: HexColor('#ffa451'),
        label: Text('Pesan Sekarang'),
        onPressed: () {
          if (widget.data[0].quantity == 0) {
            Fluttertoast.showToast(
                msg: "Out of stock",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                webShowClose: true,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (widget.role == 'student' || widget.role == 'school') {
            Fluttertoast.showToast(
                msg: "Please switch to buyer account",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                webShowClose: true,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (widget.role == 'general') {
            Fluttertoast.showToast(
                msg: "Please login first",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                webShowClose: true,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (widget.role == 'buyer' && widget.data[0].quantity != 0) {
            switchPage();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('title'),
                  content: IndexAddTransaction(
                      idProduct: widget.data[0].idProduct,
                      title: widget.data[0].title,
                      uid: widget.uid,
                      uidSeller: widget.data[0].uid,
                      price: widget.data[0].price,
                      quantity: widget.data[0].quantity,
                      qtySelected: defaultValue),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (widget.data.isNotEmpty) {
      return Scaffold(
          backgroundColor: NeuTheme.of(context).backgroundColor,
          appBar: customAppBar(context),
          floatingActionButton: floatingButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SingleChildScrollView(
              child: Container(
                  child: Column(
            children: <Widget>[
              HeaderText(title: widget.data[0].title, size: size),
              DisplayImage(url: widget.data[0].thumb, size: size),
              Description(
                  desc: widget.data[0].description,
                  qty: widget.data[0].quantity,
                  topItem: topItem())
            ],
          ))));
    }
    return Scaffold(
        backgroundColor: NeuTheme.of(context).backgroundColor,
        appBar: customAppBar(context),
        body: Center(
          child: Text('Data Not Found :('),
        ));
  }
}
