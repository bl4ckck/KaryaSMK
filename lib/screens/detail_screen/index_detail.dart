import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/screens/detail_screen/DetailScreen.dart';

class IndexDetail extends StatefulWidget {
  final String endpoint;

  IndexDetail({Key key, @required this.endpoint}) : super(key: key);

  @override
  _IndexDetailState createState() => _IndexDetailState();
}

class _IndexDetailState extends State<IndexDetail> {
  ProductDetailBloc _productDetailBloc;
  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    _productDetailBloc.add(FetchProductDetail(endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
      if (state is ProductDetailLoadingState) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: CircularProgressIndicator(),
        ));
      } else if (state is ProductDetailLoadedState) {
        return DetailScreen(data: state.data);
      } else if (state is ProductDetailFailureState) {
        return Center(child: Text('Failed to load data :('));
      }

      return Container();
    });
  }
}
