import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';

/// Base card surface for Barakah City.
///
/// Floating cards use a soft drop shadow; in-list cards use a hairline border —
/// pass [floating] accordingly. When [selected], the card lifts slightly and
/// gains a green ring (used by selectable items like building tiles).
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.floating = true,
    this.selected = false,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.color = AppColors.surfaceWhite,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool floating;
  final bool selected;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Widget card = AnimatedContainer(
      duration: AppDurations.medium,
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, selected ? -2 : 0, 0),
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadii.card,
        boxShadow: floating ? AppShadows.card : null,
        border: Border.all(
          color: selected ? AppColors.greenLight : AppColors.sandDeep,
          width: selected ? 2 : (floating ? 0 : 1),
        ),
      ),
      child: child,
    );

    if (onTap == null) return card;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.card,
        child: card,
      ),
    );
  }
}
