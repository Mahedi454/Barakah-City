import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import 'resource_visuals.dart';

/// A "+5 🪙" label that rises and fades — shown when a building produces a
/// resource. Self-removing: call [show] with an [OverlayState] and it cleans
/// itself up. Within the gallery it's previewed via the looping widget below.
class FloatingGainLabel extends StatefulWidget {
  const FloatingGainLabel({
    super.key,
    required this.type,
    required this.amount,
    this.loop = false,
  });

  final ResourceType type;
  final int amount;

  /// Repeat forever (used for the design gallery preview).
  final bool loop;

  @override
  State<FloatingGainLabel> createState() => _FloatingGainLabelState();
}

class _FloatingGainLabelState extends State<FloatingGainLabel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  );

  @override
  void initState() {
    super.initState();
    if (widget.loop) {
      _c.repeat();
    } else {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ResourceVisual v = ResourceVisual.of(widget.type);
    return AnimatedBuilder(
      animation: _c,
      builder: (BuildContext context, Widget? child) {
        final double t = Curves.easeOut.transform(_c.value);
        return Opacity(
          opacity: (1 - t).clamp(0.0, 1.0),
          child: Transform.translate(offset: Offset(0, -28 * t), child: child),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(v.icon, size: 16, color: v.color),
          const SizedBox(width: 3),
          Text(
            '+${widget.amount}',
            style: AppTypography.label.copyWith(color: v.color, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
