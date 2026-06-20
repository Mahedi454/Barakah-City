import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_typography.dart';
import 'resource_visuals.dart';

/// A single resource read-out in the HUD: a rounded pill with a coloured icon
/// badge and a tabular value. Tapping it opens that resource's detail card.
///
/// Set [trailingAdd] (used by Coins) to show a small "+" affordance for
/// "collect / get more".
class StatPill extends StatelessWidget {
  const StatPill({
    super.key,
    required this.type,
    required this.value,
    this.onTap,
    this.onAdd,
    this.alert = false,
  });

  final ResourceType type;

  /// Pre-formatted display value, e.g. "1,240", "86/100", "92%", "Plenty".
  final String value;
  final VoidCallback? onTap;

  /// When provided, renders the gold "+" affordance (Coins pill).
  final VoidCallback? onAdd;

  /// Tints the value terracotta to flag "needs attention" (e.g. Water low).
  final bool alert;

  bool get trailingAdd => onAdd != null;

  @override
  Widget build(BuildContext context) {
    final ResourceVisual v = ResourceVisual.of(type);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.chip,
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 4, trailingAdd ? 4 : 12, 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite.withValues(alpha: 0.92),
            borderRadius: AppRadii.chip,
            boxShadow: AppShadows.floating,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _IconBadge(icon: v.icon, color: v.color),
              const SizedBox(width: 6),
              AnimatedDefaultTextStyle(
                duration: AppDurations.count,
                style: AppTypography.hudNumber.copyWith(
                  color: alert ? AppColors.critical : AppColors.textDark,
                ),
                child: Text(value),
              ),
              if (trailingAdd) ...<Widget>[
                const SizedBox(width: 6),
                _AddNub(onTap: onAdd!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 17, color: color),
    );
  }
}

class _AddNub extends StatelessWidget {
  const _AddNub({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 18,
      child: Container(
        width: 22,
        height: 22,
        decoration: const BoxDecoration(
          color: AppColors.gold,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add_rounded, size: 16, color: AppColors.textOnBrand),
      ),
    );
  }
}
