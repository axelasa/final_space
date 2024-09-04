import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
class ProductImage extends StatelessWidget {

  ProductImage({
    this.url,
    this.height = 300,
    this.width = 250,
    this.onTap,
    super.key,
  });

  final String? url;
  final double? height;
  final double? width;
  final BoxFitWeb webBoxFit = BoxFitWeb.scaleDown;
  BoxFit boxFit = BoxFit.fitWidth;
  final BoxFit android = BoxFit.contain;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: url == null
              ? GestureDetector(
            onTap: onTap,
            child: Image.asset(
              "assets/no_image.jpeg",
              fit: boxFit,
              height: height,
              width: width,
            ),
          )
              : ImageNetwork(
            image: url!,
            fitWeb: webBoxFit,
            height: height!,
            width: width!,
            fitAndroidIos: android,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}