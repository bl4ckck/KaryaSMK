import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/screens/seller_screen/SoldItem.dart';
import 'package:neumorphic/neumorphic.dart';

class IndexSoldItem extends StatefulWidget {
  final String endpoint;

  IndexSoldItem({Key key, @required this.endpoint}) : super(key: key);

  @override
  _IndexSoldItemState createState() => _IndexSoldItemState();
}

class _IndexSoldItemState extends State<IndexSoldItem> {
  TransactionBloc _sellerBloc;
  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _sellerBloc = BlocProvider.of<TransactionBloc>(context);
    _sellerBloc.add(SellerFetchTransactionEvent(endpoint));
  }

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
      title: Text(
        'Sold Items',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        backgroundColor: NeuTheme.of(context).backgroundColor,
        body: SingleChildScrollView(child: SoldItem()));
  }
}
