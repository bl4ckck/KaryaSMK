import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/screens/transaction_screen/AddTransactionScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class IndexAddTransaction extends StatelessWidget {
  const IndexAddTransaction(
      {Key key,
      @required this.idProduct,
      @required this.title,
      @required this.uid,
      @required this.uidSeller,
      @required this.price,
      @required this.quantity,
      @required this.qtySelected})
      : super(key: key);
  final String idProduct, title, uid, uidSeller;
  final num price, quantity, qtySelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
      if (state is TransactionAddLoadingState) {
        return LoadingBuilder();
      } else if (state is TransactionAddStatusState) {
        return Center(child: Text('Success Transaction'));
      } else if (state is TransactionRefresh) {
        return AddTransactionScreen(
            idProduct: idProduct,
            title: title,
            uid: uid,
            uidSeller: uidSeller,
            price: price,
            quantity: quantity,
            qtySelected: qtySelected);
      }

      return Container();

      //TODO: yg kardus pizza yg awal apus aja karna idnya ga sama kaya yg di docnya
    });
  }
}
