import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// A small 8-point Islamic-inspired star, used as a quiet decorative accent in
/// headers and dividers. Drawn with a custom painter so it scales crisply.
class GeometricStar extends StatelessWidget {
  const GeometricStar({super.key, this.size = 16, this.color = AppColors.gold});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _StarPainter(color)),
    );
  }
}

class _StarPainter extends CustomPainter {
  _StarPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = Offset(size.width / 2, size.height / 2);
    final double rOuter = size.width / 2;
    final double rInner = rOuter * 0.62;
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    const int points = 8;
    for (int i = 0; i < points * 2; i++) {
      final double r = i.isEven ? rOuter : rInner;
      final double a = (math.pi / points) * i - math.pi / 2;
      final Offset p = c + Offset(math.cos(a) * r, math.sin(a) * r);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_StarPainter oldDelegate) => oldDelegate.color != color;
}

/// A hairline divider with a centred geometric star — a softer alternative to a
/// plain rule for separating sections in panels and dialogs.
class GeometricDivider extends StatelessWidget {
  const GeometricDivider({super.key, this.color = AppColors.sandDeep});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: color, thickness: 1)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GeometricStar(size: 12, color: AppColors.gold),
        ),
        Expanded(child: Divider(color: color, thickness: 1)),
      ],
    );
  }
}
