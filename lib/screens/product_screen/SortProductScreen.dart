import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/CategoryList.dart';
import 'package:neumorphic/neumorphic.dart';

class SortProductScreen extends StatelessWidget {
  final String title;
  const SortProductScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) + 50;
    final double itemWidth = size.width / 2;

    Widget customAppBar(BuildContext ctx) {
      return AppBar(
        centerTitle: true,
        title: Text(
          title,
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

    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: NeuTheme.of(context).backgroundColor,
      body: CategoryList(
        itemHeight: itemHeight,
        itemWidth: itemWidth,
      ),
    );
  }
}
