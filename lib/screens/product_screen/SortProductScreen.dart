import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/category_bloc/category_bloc.dart';
import 'package:karyasmk/widgets/CategoryList.dart';
import 'package:neumorphic/neumorphic.dart';

class SortProductScreen extends StatefulWidget {
  final String title;
  const SortProductScreen({Key key, @required this.title}) : super(key: key);

  @override
  _SortProductScreenState createState() => _SortProductScreenState();
}

class _SortProductScreenState extends State<SortProductScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) + 50;
    final double itemWidth = size.width / 2;

    return SingleChildScrollView(
      child: CategoryList(
        itemHeight: itemHeight,
        itemWidth: itemWidth,
      ),
    );
  }
}
