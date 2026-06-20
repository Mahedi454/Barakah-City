import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_radii.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

/// Visual emphasis of a button.
///
/// Hierarchy rule: at most ONE [AppButtonVariant.primary] (gold) per screen —
/// gold means "do this". Green ([AppButtonVariant.secondary]) carries the rest.
enum AppButtonVariant { primary, secondary, soft, ghost }

enum AppButtonSize { large, medium }

/// The core Barakah City button.
///
/// Tactile "candy" feel: a solid face sits on a darker 3px bottom *lip*. On
/// press the face sinks into the lip (translate down + scale 0.98), giving a
/// physical, pressable response without glossy skeuomorphism.
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.secondary,
    this.size = AppButtonSize.large,
    this.icon,
    this.expand = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;

  /// Stretch to the full width of the parent.
  final bool expand;

  bool get _enabled => onPressed != null;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _down = false;

  void _setDown(bool v) {
    if (widget._enabled && _down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    final _ButtonPalette p = _paletteFor(widget.variant, widget._enabled);
    final bool isLarge = widget.size == AppButtonSize.large;
    final double radius = isLarge ? AppRadii.md : AppRadii.sm;
    final double vPad = isLarge ? 14 : 10;
    final double hPad = isLarge ? AppSpacing.xl : AppSpacing.lg;
    const double lip = 3;
    final bool pressed = _down && widget._enabled;

    Widget content = Row(
      mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (widget.icon != null) ...<Widget>[
          Icon(widget.icon, size: isLarge ? 20 : 18, color: p.foreground),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(
          widget.label,
          style: (isLarge ? AppTypography.label.copyWith(fontSize: 15) : AppTypography.label)
              .copyWith(color: p.foreground),
        ),
      ],
    );

    final Widget face = AnimatedContainer(
      duration: AppDurations.fast,
      curve: Curves.easeOut,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      transform: Matrix4.translationValues(0, pressed ? lip : 0, 0),
      decoration: BoxDecoration(
        color: p.fill,
        borderRadius: BorderRadius.circular(radius),
        border: p.border == null ? null : Border.all(color: p.border!, width: 1.5),
      ),
      child: content,
    );

    return Semantics(
      button: true,
      enabled: widget._enabled,
      label: widget.label,
      child: GestureDetector(
        onTapDown: (_) => _setDown(true),
        onTapUp: (_) => _setDown(false),
        onTapCancel: () => _setDown(false),
        onTap: widget.onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSpacing.tapTarget),
          child: SizedBox(
            width: widget.expand ? double.infinity : null,
            // The lip lives underneath; the face slides down onto it on press.
            child: Container(
              decoration: p.lip == null
                  ? null
                  : BoxDecoration(
                      color: p.lip,
                      borderRadius: BorderRadius.circular(radius),
                    ),
              padding: EdgeInsets.only(bottom: p.lip == null ? 0 : lip),
              child: face,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPalette {
  const _ButtonPalette({
    required this.fill,
    required this.foreground,
    this.lip,
    this.border,
  });

  final Color fill;
  final Color foreground;
  final Color? lip;
  final Color? border;
}

_ButtonPalette _paletteFor(AppButtonVariant variant, bool enabled) {
  if (!enabled) {
    return const _ButtonPalette(
      fill: AppColors.disabled,
      foreground: AppColors.textMuted,
    );
  }
  switch (variant) {
    case AppButtonVariant.primary:
      return const _ButtonPalette(
        fill: AppColors.gold,
        foreground: AppColors.textOnBrand,
        lip: AppColors.goldDeep,
      );
    case AppButtonVariant.secondary:
      return const _ButtonPalette(
        fill: AppColors.green,
        foreground: AppColors.textOnBrand,
        lip: AppColors.greenDeep,
      );
    case AppButtonVariant.soft:
      return const _ButtonPalette(
        fill: AppColors.greenMist,
        foreground: AppColors.greenDeep,
        border: AppColors.sandDeep,
      );
    case AppButtonVariant.ghost:
      return const _ButtonPalette(
        fill: Colors.transparent,
        foreground: AppColors.green,
      );
  }
}
