import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/category_bloc/category_bloc.dart';
import 'package:karyasmk/screens/product_screen/SortProductScreen.dart';
import 'package:neumorphic/neumorphic.dart';

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

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
      centerTitle: true,
      title: Text(
        widget.endpoint,
        style: TextStyle(color: Colors.black),
      ),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
            size: 30,
          ),
          onPressed: () {
            refresh();
          },
        ),
        backgroundColor: NeuTheme.of(context).backgroundColor,
        body: SortProductScreen(title: endpoint));
  }

  void refresh() async {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(PushCategoryEvent(endpoint));
  }
}
