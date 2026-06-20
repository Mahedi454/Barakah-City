import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// The five core resources, in HUD display order.
///
/// This is a *presentation* concern: it maps each resource to its icon, hue,
/// and label. The domain layer stays pure Dart and knows nothing about colours
/// or icons.
enum ResourceType { coins, population, happiness, water, education }

/// Visual descriptor for a [ResourceType] — one hue per resource so the player
/// can read the HUD pre-attentively, without parsing numbers.
class ResourceVisual {
  const ResourceVisual({
    required this.type,
    required this.label,
    required this.icon,
    required this.color,
  });

  final ResourceType type;
  final String label;
  final IconData icon;
  final Color color;

  static const Map<ResourceType, ResourceVisual> _all =
      <ResourceType, ResourceVisual>{
    ResourceType.coins: ResourceVisual(
      type: ResourceType.coins,
      label: 'Coins',
      icon: Icons.monetization_on_rounded,
      color: AppColors.coin,
    ),
    ResourceType.population: ResourceVisual(
      type: ResourceType.population,
      label: 'Population',
      icon: Icons.groups_rounded,
      color: AppColors.population,
    ),
    ResourceType.happiness: ResourceVisual(
      type: ResourceType.happiness,
      label: 'Happiness',
      icon: Icons.wb_sunny_rounded,
      color: AppColors.happiness,
    ),
    ResourceType.water: ResourceVisual(
      type: ResourceType.water,
      label: 'Water',
      icon: Icons.water_drop_rounded,
      color: AppColors.water,
    ),
    ResourceType.education: ResourceVisual(
      type: ResourceType.education,
      label: 'Education',
      icon: Icons.menu_book_rounded,
      color: AppColors.education,
    ),
  };

  static ResourceVisual of(ResourceType type) => _all[type]!;
}
