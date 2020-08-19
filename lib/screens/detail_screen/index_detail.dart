import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/screens/detail_screen/DetailScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class IndexDetail extends StatefulWidget {
  final String endpoint;

  IndexDetail({Key key, @required this.endpoint}) : super(key: key);

  @override
  _IndexDetailState createState() => _IndexDetailState();
}

class _IndexDetailState extends State<IndexDetail> {
  ProductDetailBloc _productDetailBloc;
  String get endpoint => widget.endpoint;
  String sessionRole;
  String uid;

  @override
  void initState() {
    super.initState();
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    _productDetailBloc.add(FetchProductDetail(endpoint));

    loadBox();
  }

  void loadBox() async {
    final box = await Hive.openBox('sessionUser');

    setState(() {
      sessionRole = box.isNotEmpty ? box.getAt(0).type : 'general';
      uid = box.isNotEmpty ? box.getAt(0).uid : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
        if (state is ProductDetailLoadingState) {
          return LoadingBuilder();
        } else if (state is ProductDetailLoadedState) {
          return DetailScreen(data: state.data, role: sessionRole, uid: uid);
        } else if (state is ProductDetailFailureState) {
          return Center(child: Text('Failed to load data :('));
        }

        return Container();
      }),
    );
  }
}
