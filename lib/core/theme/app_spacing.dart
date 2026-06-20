/// Spacing scale for Barakah City (4pt grid).
///
/// One source of truth for gaps, padding, and margins so the whole UI breathes
/// on the same rhythm. Screen margins are [screen]; safe-area handling lives in
/// `AppScaffold`.
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  /// Default horizontal margin from the screen edge.
  static const double screen = 16;

  /// Minimum interactive tap target (accessibility floor).
  static const double tapTarget = 48;
}
