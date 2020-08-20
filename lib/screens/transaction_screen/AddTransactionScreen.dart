import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/helper/currencyFormat.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({
    Key key,
    @required this.idProduct,
    @required this.title,
    @required this.uid,
    @required this.uidSeller,
    @required this.price,
    @required this.quantity,
    @required this.qtySelected,
  }) : super(key: key);
  final String idProduct, title, uid, uidSeller;
  final num price, quantity, qtySelected;

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TransactionBloc _transactionBloc;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  ProductDetailBloc _productDetailBloc;
  String get endpoint => widget.idProduct;

  void submit() async {
    num totalPrice = widget.price * widget.qtySelected;
    num qtyResult = widget.quantity - widget.qtySelected;

    _transactionBloc = BlocProvider.of<TransactionBloc>(context);
    _transactionBloc.add(PostTransaction(
        idProduct: widget.idProduct,
        price: totalPrice,
        qtyResult: qtyResult,
        quantity: widget.qtySelected,
        title: widget.title,
        uid: widget.uid,
        uidSeller: widget.uidSeller));

    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    _productDetailBloc.add(FetchProductDetail(endpoint));
  }

  Widget submitButton() {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orangeAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          submit();
        },
        child: Text("Confirm",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    num totalPrice = widget.price * widget.qtySelected;

    return SingleChildScrollView(
      child: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('Product Name:', style: style.copyWith(fontSize: 17)),
            Text(
              widget.title,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Total Item:', style: style.copyWith(fontSize: 17)),
            Text(
              '${widget.qtySelected}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Total Price:', style: style.copyWith(fontSize: 17)),
            Text(
              currencyFormat(totalPrice),
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 22,
            ),
            submitButton()
          ],
        )),
      ),
    );
  }
}
