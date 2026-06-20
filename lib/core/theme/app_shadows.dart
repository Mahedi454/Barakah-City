import 'package:flutter/widgets.dart';

/// Soft, warm shadows. Light is gentle and high — shadows are diffuse and low
/// in opacity so cards float without feeling heavy.
class AppShadows {
  AppShadows._();

  /// Resting elevation for cards and stat pills.
  static const List<BoxShadow> card = <BoxShadow>[
    BoxShadow(
      color: Color(0x14000000), // 8% black
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  /// Slightly lifted — selected cards, the build tray.
  static const List<BoxShadow> raised = <BoxShadow>[
    BoxShadow(
      color: Color(0x1F000000), // 12% black
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  /// Tight contact shadow for floating round buttons / HUD pills.
  static const List<BoxShadow> floating = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000), // 10% black
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}
