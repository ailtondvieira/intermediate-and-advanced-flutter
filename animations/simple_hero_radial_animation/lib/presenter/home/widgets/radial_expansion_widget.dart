import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectExtent;
  final Widget? child;

  const RadialExpansion({
    Key? key,
    required this.maxRadius,
    this.child,
  })  : clipRectExtent = 2 * (maxRadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          height: clipRectExtent,
          width: clipRectExtent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: child,
          ),
        ),
      ),
    );
  }
}
