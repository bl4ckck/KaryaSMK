import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:karyasmk/screens/seller_screen/AddProduct.dart';
import 'package:karyasmk/screens/seller_screen/SuccessScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';
import 'package:neumorphic/neumorphic.dart';

class IndexAddProduct extends StatelessWidget {
  const IndexAddProduct({Key key}) : super(key: key);

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
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
      body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
        if (state is ProductAddLoadingState) {
          return LoadingBuilder();
        } else if (state is ProductAddStatusState) {
          return SuccessScreen();
        }
        return AddProduct();
      }),
    );
  }
}
