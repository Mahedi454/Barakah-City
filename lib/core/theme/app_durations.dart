/// Motion timing. Barakah City moves calmly — animations are slow and organic,
/// never snappy or explosive. Curves favour ease-out for a settled feel.
class AppDurations {
  AppDurations._();

  /// Button press feedback.
  static const Duration fast = Duration(milliseconds: 120);

  /// Card / element entrances (fade + rise).
  static const Duration medium = Duration(milliseconds: 180);

  /// Sheets, trays, screen overlays sliding in.
  static const Duration slow = Duration(milliseconds: 280);

  /// Resource count-up and ambient pulses.
  static const Duration count = Duration(milliseconds: 600);
}
