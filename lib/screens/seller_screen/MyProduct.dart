import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/bloc/seller_product_bloc/seller_product_bloc.dart';
import 'package:karyasmk/widgets/CardItem.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class MyProduct extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;

  const MyProduct({Key key, this.itemHeight, this.itemWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProductBloc, SellerProductState>(
      builder: (context, state) {
        if (state is SellerProductLoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: LoadingBuilder(),
          );
        } else if (state is SellerProductLoadedState) {
          var mystate = state.sellerProduct;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            controller: new ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mystate.length,
            itemBuilder: (BuildContext context, int i) {
              var index = mystate[i];

              return CardItem(
                idProduct: index.idProduct,
                title: index.title,
                image: index.thumb,
                price: index.price,
              );
            },
          );
        } else if (state is SellerProductFailurState) {
          return Center(child: Text('Failed to load data :('));
        }
        return Container();
      },
    );
  }
}
