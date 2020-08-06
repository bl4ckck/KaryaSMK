import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:karyasmk/widgets/CardItem.dart';
import 'package:flutter/foundation.dart';

class TerbaruList extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;

  const TerbaruList({Key key, this.itemHeight, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListLoadingState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Text('loading...'),
          );
        } else if (state is ProductListStateLoaded) {
          var mystate = state.productList;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 0.0,
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
                idProduct: index.id_product,
                title: index.title,
                image: index.thumb,
                price: index.price,
              );
              // return Text('awe');
            },
          );
        } else if (state is ProductListStateFailure) {
          return Text('Cek koneksi internet anda');
        }
        return Container();
      },
    );
  }
}
