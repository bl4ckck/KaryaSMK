import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/screens/delete_screen/DeleteScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class IndexDelete extends StatefulWidget {
  final String endpoint;

  IndexDelete({Key key, @required this.endpoint}) : super(key: key);

  @override
  _IndexDeleteState createState() => _IndexDeleteState();
}

class _IndexDeleteState extends State<IndexDelete> {
  ProductDetailBloc _productDetailBloc;
  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    _productDetailBloc.add(ViewDeleteProductDetail(endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
        if (state is ViewDeleteProductDetailLoadingState) {
          return LoadingBuilder();
        } else if (state is ViewDeleteProductDetailLoadedState) {
          return DeleteScreen(data: state.data);
        } else if (state is ViewDeleteProductDetailFailureState) {
          return Center(child: Text('Failed to load data :('));
        }

        return Container();
      }),
    );
  }
}
