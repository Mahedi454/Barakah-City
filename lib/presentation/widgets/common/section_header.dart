import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'geometric_divider.dart';

/// A section title with an optional trailing action (e.g. "See all"). Uses a
/// small geometric star accent to carry the Islamic-inspired motif quietly.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.showAccent = true,
  });

  final String title;
  final Widget? trailing;
  final bool showAccent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (showAccent) ...<Widget>[
          const GeometricStar(size: 14, color: AppColors.gold),
          const SizedBox(width: 8),
        ],
        Expanded(child: Text(title, style: AppTypography.titleM)),
        ?trailing,
      ],
    );
  }
}
