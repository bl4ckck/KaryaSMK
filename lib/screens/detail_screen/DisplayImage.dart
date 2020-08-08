import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/ImageViewWrapper.dart';

class DisplayImage extends StatelessWidget {
  final Size size;

  const DisplayImage({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ImageViewWrapper(
              backgroundDecoration: BoxDecoration(color: Colors.white),
              imageProvider: AssetImage("assets/images/sepeda.jpg"),
            ),
          ),
        );
      },
      child: Container(
        width: size.width,
        height: 200,
        child: Image.asset(
          'assets/images/sepeda.jpg',
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
