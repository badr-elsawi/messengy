import 'dart:ui';

import 'package:flutter/material.dart';

class Blury extends StatelessWidget {
  Widget child;
  double sigmaX;
  double sigmaY;
  double borderRadius;

  Blury({
    required this.child,
    this.borderRadius = 20,
    this.sigmaX = 15,
    this.sigmaY = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX,sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
