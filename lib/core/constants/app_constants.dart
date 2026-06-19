/// App-wide static values. Game-balance numbers do NOT live here — those
/// belong in the domain layer once the systems phase begins.
class AppConstants {
  AppConstants._();

  static const String appName = 'Barakah City';

  /// The five core resources tracked by the city.
  static const List<String> resourceKeys = <String>[
    'coins',
    'population',
    'happiness',
    'water',
    'education',
  ];

  /// Milestone tiers for peaceful, no-lose progression.
  static const List<String> cityTiers = <String>[
    'Village',
    'Town',
    'City',
    'Barakah City',
  ];
}
