import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/icons/painter/ox_system_logo_painter.dart';

class OxSystemLogo extends StatelessWidget {
  final double width;

  const OxSystemLogo({required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, width * 0.27),
      painter: OxSystemLogoPainter(),
    );
  }
}
