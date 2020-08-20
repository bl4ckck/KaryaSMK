import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';
import 'package:karyasmk/widgets/PurchasedItem.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: LoadingBuilder(),
          );
        } else if (state is TransactionLoadedState) {
          var mystate = state.transaction;

          return ListView.builder(
            controller: new ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mystate.length,
            itemBuilder: (BuildContext context, int i) {
              var index = mystate[i];

              return PurchasedItem(
                  date: index.date,
                  item: index.quantity,
                  price: index.price,
                  title: index.title);
            },
          );
        } else if (state is TransactionFailurState) {
          return Center(child: Text('Failed to load data :('));
        }
        return Container();
      },
    );
  }
}
