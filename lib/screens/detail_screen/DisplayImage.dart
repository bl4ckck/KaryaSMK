import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/widgets/ImageViewWrapper.dart';

class DisplayImage extends StatelessWidget {
  final Size size;
  final String url;

  const DisplayImage({Key key, @required this.url, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewWrapper(
              backgroundDecoration: BoxDecoration(color: Colors.white),
              imageProvider: NetworkImage(url),
            ),
          ),
        );
      },
      child: Container(
        width: size.width,
        height: 200,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          height: double.infinity,
          placeholder: (context, url) =>
              Center(child: Image.asset('assets/images/placeholder.jpg')),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
