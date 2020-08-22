import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/bloc/category_bloc/category_bloc.dart';
import 'package:karyasmk/widgets/CardItem.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class CategoryList extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;

  const CategoryList({Key key, this.itemHeight, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: LoadingBuilder(),
          );
        } else if (state is CategoryStateLoaded) {
          var mystate = state.categoryList;

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
                cacheExtent: 10000,
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
              ),
            ],
          );
        } else if (state is CategoryStateFailure) {
          return Center(child: Text('Failed to load data :('));
        }
        return Container();
      },
    );
  }
}
