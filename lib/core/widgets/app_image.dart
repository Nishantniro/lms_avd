import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.imageUrl,
    this.bgColor,

    this.size = const Size(100, 100),
  }) : isCircle = false,
       radius = 0,
       fit = BoxFit.cover;

  const AppImage.circle({
    super.key,
    this.imageUrl,
    this.bgColor,
    this.radius = 60,
    this.fit = BoxFit.cover,
  }) : isCircle = true,
       size = null;

  final String? imageUrl;
  final double radius;
  final bool isCircle;
  final Size? size;
  final Color? bgColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return circleImagePreview();
    }
    return rectangleImagePreview();
  }

  Widget circleImagePreview() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: bgColor,
      backgroundImage: imageUrl == null ? null : NetworkImage(imageUrl!),
    );
  }

  Widget rectangleImagePreview() {
    return Container(
      height: size!.height,
      width: size!.width,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: imageUrl == null
            ? null
            : DecorationImage(image: NetworkImage(imageUrl!), fit: fit),
      ),
    );
  }
}
