import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_typography.dart';
import 'geometric_divider.dart';

/// A small badge showing the city's current milestone tier
/// (Village → Town → City → Barakah City). Gold-framed, with the star motif.
class TierBadge extends StatelessWidget {
  const TierBadge({super.key, required this.tier});

  final String tier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.goldSoft,
        borderRadius: AppRadii.chip,
        border: Border.all(color: AppColors.gold, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const GeometricStar(size: 13, color: AppColors.goldDeep),
          const SizedBox(width: 6),
          Text(
            tier,
            style: AppTypography.label.copyWith(color: AppColors.goldDeep),
          ),
        ],
      ),
    );
  }
}
