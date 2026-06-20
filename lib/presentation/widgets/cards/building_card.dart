import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../hud/cost_chip.dart';
import '../hud/resource_visuals.dart';
import 'app_card.dart';

/// A single resource cost for a building (resource + amount).
class BuildingCost {
  const BuildingCost(this.type, this.amount, {this.affordable = true});

  final ResourceType type;
  final int amount;
  final bool affordable;
}

/// A building entry in the Build Tray / catalog.
///
/// Vertical layout: illustrated thumbnail tile, title, one-line description, and
/// a cost row. Handles three states: normal, locked (greyed with an unlock
/// condition), and can't-afford (costs in terracotta).
class BuildingCard extends StatelessWidget {
  const BuildingCard({
    super.key,
    required this.name,
    required this.description,
    required this.icon,
    required this.costs,
    this.onTap,
    this.selected = false,
    this.locked = false,
    this.unlockHint,
    this.ownedCount,
    this.accent = AppColors.greenMist,
    this.width = 150,
  });

  final String name;
  final String description;
  final IconData icon;
  final List<BuildingCost> costs;
  final VoidCallback? onTap;
  final bool selected;
  final bool locked;

  /// Shown on the lock overlay, e.g. "Reach Town".
  final String? unlockHint;

  /// Optional "x3" placed-count badge.
  final int? ownedCount;
  final Color accent;
  final double width;

  bool get _affordable => !locked && costs.every((BuildingCost c) => c.affordable);

  @override
  Widget build(BuildContext context) {
    final Widget card = AppCard(
      onTap: locked ? null : onTap,
      selected: selected,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _Thumbnail(icon: icon, accent: accent, ownedCount: ownedCount),
          const SizedBox(height: AppSpacing.sm),
          Text(name, style: AppTypography.titleM.copyWith(fontSize: 16)),
          const SizedBox(height: 2),
          Text(
            description,
            style: AppTypography.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: <Widget>[
              for (final BuildingCost c in costs)
                CostChip(
                  type: c.type,
                  amount: '${c.amount}',
                  affordable: c.affordable,
                ),
            ],
          ),
        ],
      ),
    );

    return SizedBox(
      width: width,
      child: Stack(
        children: <Widget>[
          // Dim the whole card content when it can't be afforded.
          Opacity(opacity: _affordable ? 1 : 0.85, child: card),
          if (locked) _LockOverlay(hint: unlockHint),
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.icon, required this.accent, this.ownedCount});

  final IconData icon;
  final Color accent;
  final int? ownedCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 76,
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          alignment: Alignment.center,
          child: Icon(icon, size: 40, color: AppColors.greenDeep),
        ),
        if (ownedCount != null)
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.all(Radius.circular(AppRadii.pill)),
              ),
              child: Text(
                'x$ownedCount',
                style: AppTypography.label.copyWith(color: AppColors.textOnBrand, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }
}

class _LockOverlay extends StatelessWidget {
  const _LockOverlay({this.hint});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: AppRadii.card,
        child: Container(
          color: AppColors.cream.withValues(alpha: 0.78),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.lock_rounded, color: AppColors.textMuted, size: 26),
              if (hint != null) ...<Widget>[
                const SizedBox(height: 4),
                Text(hint!, style: AppTypography.label.copyWith(color: AppColors.textMuted)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
