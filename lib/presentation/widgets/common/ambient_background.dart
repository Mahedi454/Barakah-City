import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// The "golden-hour storybook" backdrop: a soft vertical gradient from sky to
/// ground. Sits behind every screen so the UI and the (future) Flame city share
/// one continuous world.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.sky,
            AppColors.skySoft,
            AppColors.cream,
            AppColors.sand,
          ],
          stops: <double>[0.0, 0.28, 0.62, 1.0],
        ),
      ),
      child: child,
    );
  }
}
