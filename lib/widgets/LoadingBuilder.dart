import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitCubeGrid(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.orange : Colors.orangeAccent,
          ),
        );
      },
    );

    return Center(child: Container(child: spinkit));
  }
}
