import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class VectorPicture extends StatelessWidget {
  final String path;

  final double? height;
  final double? width;

  final BoxFit fit;
  final Color? color;

  const VectorPicture.asset(
    this.path, {
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AssetBytesLoader(path),
      fit: fit,
      height: height,
      width: width,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
