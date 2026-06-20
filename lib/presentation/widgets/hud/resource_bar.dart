import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../buttons/icon_round_button.dart';
import 'resource_visuals.dart';
import 'stat_pill.dart';

/// Immutable snapshot of what the HUD should show. The Dashboard builds this
/// from game state; the bar itself is dumb and just renders.
class ResourceBarData {
  const ResourceBarData({
    required this.coins,
    required this.population,
    required this.happiness,
    required this.water,
    required this.cityLevel,
    this.waterLow = false,
  });

  final String coins; // "1,240"
  final String population; // "86/100"
  final String happiness; // "92%"
  final String water; // "Plenty" | "Ok" | "Low"
  final String cityLevel; // "Lv2"
  final bool waterLow;
}

/// The persistent top HUD: a floating, horizontally-scrollable row of
/// [StatPill]s with a settings gear on the left. Lives as a Flutter overlay
/// above the Flame city canvas — never inside it.
class ResourceBar extends StatelessWidget {
  const ResourceBar({
    super.key,
    required this.data,
    this.onSettings,
    this.onAddCoins,
    this.onResourceTap,
  });

  final ResourceBarData data;
  final VoidCallback? onSettings;
  final VoidCallback? onAddCoins;
  final ValueChanged<ResourceType>? onResourceTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: <Widget>[
            IconRoundButton(
              icon: Icons.settings_rounded,
              onPressed: onSettings,
              tooltip: 'Settings',
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                child: Row(
                  children: <Widget>[
                    StatPill(
                      type: ResourceType.coins,
                      value: data.coins,
                      onAdd: onAddCoins,
                      onTap: () => onResourceTap?.call(ResourceType.coins),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    StatPill(
                      type: ResourceType.population,
                      value: data.population,
                      onTap: () => onResourceTap?.call(ResourceType.population),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    StatPill(
                      type: ResourceType.happiness,
                      value: data.happiness,
                      onTap: () => onResourceTap?.call(ResourceType.happiness),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    StatPill(
                      type: ResourceType.water,
                      value: data.water,
                      alert: data.waterLow,
                      onTap: () => onResourceTap?.call(ResourceType.water),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    StatPill(
                      type: ResourceType.education,
                      value: data.cityLevel,
                      onTap: () => onResourceTap?.call(ResourceType.education),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
