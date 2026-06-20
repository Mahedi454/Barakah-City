import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// A tiny face that reflects city happiness. Expressions shift gently across a
/// peaceful range — content → neutral → wistful. It is *never* angry: this is a
/// no-punishment game, so low happiness reads as "a little sad", not "failing".
class HappinessFace extends StatelessWidget {
  const HappinessFace({super.key, required this.percent, this.size = 24});

  /// 0–100.
  final double percent;
  final double size;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    if (percent >= 75) {
      icon = Icons.sentiment_very_satisfied_rounded;
    } else if (percent >= 50) {
      icon = Icons.sentiment_satisfied_rounded;
    } else if (percent >= 30) {
      icon = Icons.sentiment_neutral_rounded;
    } else {
      icon = Icons.sentiment_dissatisfied_rounded; // wistful, not angry
    }
    return Icon(icon, size: size, color: AppColors.happiness);
  }
}
