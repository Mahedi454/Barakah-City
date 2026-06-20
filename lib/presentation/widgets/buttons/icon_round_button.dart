import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';

/// A soft, floating round icon button — HUD gear, close (×), the small coin "+".
///
/// Defaults to a warm-white face with a tinted icon; pass [filled] for a solid
/// brand-coloured variant.
class IconRoundButton extends StatefulWidget {
  const IconRoundButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor = AppColors.green,
    this.background = AppColors.surfaceWhite,
    this.size = 44,
    this.tooltip,
  });

  /// Solid brand variant: white icon on a coloured face.
  factory IconRoundButton.filled({
    Key? key,
    required IconData icon,
    required VoidCallback? onPressed,
    Color color = AppColors.green,
    double size = 44,
    String? tooltip,
  }) {
    return IconRoundButton(
      key: key,
      icon: icon,
      onPressed: onPressed,
      iconColor: AppColors.textOnBrand,
      background: color,
      size: size,
      tooltip: tooltip,
    );
  }

  final IconData icon;
  final VoidCallback? onPressed;
  final Color iconColor;
  final Color background;
  final double size;
  final String? tooltip;

  @override
  State<IconRoundButton> createState() => _IconRoundButtonState();
}

class _IconRoundButtonState extends State<IconRoundButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;
    Widget button = GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _down = true) : null,
      onTapUp: enabled ? (_) => setState(() => _down = false) : null,
      onTapCancel: enabled ? () => setState(() => _down = false) : null,
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _down ? 0.92 : 1,
        duration: AppDurations.fast,
        curve: Curves.easeOut,
        child: Container(
          width: widget.size,
          height: widget.size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: enabled ? widget.background : AppColors.disabled,
            shape: BoxShape.circle,
            boxShadow: AppShadows.floating,
          ),
          child: Icon(
            widget.icon,
            size: widget.size * 0.5,
            color: enabled ? widget.iconColor : AppColors.textMuted,
          ),
        ),
      ),
    );

    // Keep the visual size but guarantee an accessible tap target.
    button = SizedBox(
      width: widget.size < AppSpacing.tapTarget ? AppSpacing.tapTarget : widget.size,
      height: widget.size < AppSpacing.tapTarget ? AppSpacing.tapTarget : widget.size,
      child: Center(child: button),
    );

    if (widget.tooltip != null) {
      button = Tooltip(message: widget.tooltip!, child: button);
    }
    return Semantics(button: true, enabled: enabled, child: button);
  }
}
