import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/category_bloc/category_bloc.dart';
import 'package:karyasmk/screens/product_screen/SortProductScreen.dart';

class IndexSortScreen extends StatefulWidget {
  final String endpoint;

  IndexSortScreen({Key key, @required this.endpoint}) : super(key: key);

  @override
  _IndexSortScreenState createState() => _IndexSortScreenState();
}

class _IndexSortScreenState extends State<IndexSortScreen> {
  CategoryBloc _categoryBloc;
  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);

    _categoryBloc.add(InitialFetchCategoryEvent(endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SortProductScreen(title: endpoint));
  }
}
