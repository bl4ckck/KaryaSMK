import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewWrapper extends StatelessWidget {
  const ImageViewWrapper({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: PhotoView(
          imageProvider: imageProvider,
          loadingBuilder: loadingBuilder,
          onTapUp: (context, details, controllerValue) {
            Navigator.of(context).pop();
          },
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
        ),
      ),
    );
  }
}
