import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/bloc/school_bloc/school_bloc.dart';
import 'package:karyasmk/widgets/CardDeleteItem.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class SchoolProduct extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;

  const SchoolProduct({Key key, this.itemHeight, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (context, state) {
        if (state is SchoolLoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: LoadingBuilder(),
          );
        } else if (state is SchoolStateLoaded) {
          var mystate = state.schoolProduct;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            controller: new ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            cacheExtent: 10000,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mystate.length,
            itemBuilder: (BuildContext context, int i) {
              var index = mystate[i];

              return CardDeleteItem(
                idProduct: index.idProduct,
                title: index.title,
                image: index.thumb,
                price: index.price,
              );
            },
          );
        } else if (state is SchoolStateFailure) {
          return Center(child: Text('Failed to load data :('));
        }
        return Container();
      },
    );
  }
}
