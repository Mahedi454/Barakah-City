import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_typography.dart';

/// The persistent "Build" entry point on the Dashboard.
///
/// Gold (primary emphasis) with a darker lip and a soft outer glow so it reads
/// as *the* call to action over the city canvas.
class BuildFab extends StatefulWidget {
  const BuildFab({
    super.key,
    required this.onPressed,
    this.label = 'Build',
    this.icon = Icons.construction_rounded,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData icon;

  @override
  State<BuildFab> createState() => _BuildFabState();
}

class _BuildFabState extends State<BuildFab> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;
    const double lip = 4;
    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.label,
      child: GestureDetector(
        onTapDown: enabled ? (_) => setState(() => _down = true) : null,
        onTapUp: enabled ? (_) => setState(() => _down = false) : null,
        onTapCancel: enabled ? () => setState(() => _down = false) : null,
        onTap: widget.onPressed,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.goldDeep,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0x33D9A441), // soft gold glow
                blurRadius: 18,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.only(bottom: lip),
          child: AnimatedContainer(
            duration: AppDurations.fast,
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, _down && enabled ? lip : 0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: enabled ? AppColors.gold : AppColors.disabled,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(widget.icon, color: AppColors.textOnBrand, size: 22),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: AppTypography.label
                      .copyWith(color: AppColors.textOnBrand, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
