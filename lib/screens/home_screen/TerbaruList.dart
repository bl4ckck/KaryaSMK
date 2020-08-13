import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:karyasmk/widgets/CardItem.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

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
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: LoadingBuilder(),
          );
        } else if (state is ProductListStateLoaded) {
          var mystate = state.productList;

          return Column(
            children: <Widget>[
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                controller: new ScrollController(keepScrollOffset: false),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: (mystate.length < 4) ? mystate.length : 4,
                itemBuilder: (BuildContext context, int i) {
                  var index = mystate[i];

                  return CardItem(
                    idProduct: index.id_product,
                    title: index.title,
                    image: index.thumb,
                    price: index.price,
                  );
                },
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      'Load More...',
                      style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.blue,
                          fontFamily: 'Roboto'),
                    )),
              ),
            ],
          );
        } else if (state is ProductListStateFailure) {
          return Center(child: Text('Failed to load data :('));
        }
        return Container();
      },
    );
  }
}
