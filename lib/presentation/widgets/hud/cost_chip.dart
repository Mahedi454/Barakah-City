import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_typography.dart';
import 'resource_visuals.dart';

/// A small capsule showing a resource amount — a building's cost, a reward, or
/// any "icon + number" read-out. Turns terracotta when [affordable] is false.
class CostChip extends StatelessWidget {
  const CostChip({
    super.key,
    required this.type,
    required this.amount,
    this.affordable = true,
    this.tinted = true,
  });

  final ResourceType type;
  final String amount;

  /// When false the text goes terracotta to signal "can't afford".
  final bool affordable;

  /// Whether to show the soft tinted background (false = bare icon + text).
  final bool tinted;

  @override
  Widget build(BuildContext context) {
    final ResourceVisual v = ResourceVisual.of(type);
    final Color textColor = affordable ? AppColors.textDark : AppColors.critical;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: tinted ? 8 : 0, vertical: tinted ? 4 : 0),
      decoration: tinted
          ? BoxDecoration(
              color: v.color.withValues(alpha: 0.12),
              borderRadius: AppRadii.chip,
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(v.icon, size: 15, color: v.color),
          const SizedBox(width: 4),
          Text(
            amount,
            style: AppTypography.label.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
