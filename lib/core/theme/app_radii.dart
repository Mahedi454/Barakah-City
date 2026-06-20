import 'package:flutter/widgets.dart';

/// Corner-radius scale. Everything in Barakah City is soft and rounded —
/// nothing in this game has a hard 90° corner.
class AppRadii {
  AppRadii._();

  static const double sm = 12; // medium buttons, cost chips
  static const double md = 16; // large buttons, inner tiles
  static const double lg = 20; // cards
  static const double xl = 28; // bottom sheets, big panels
  static const double pill = 999; // stat pills, chips, capsules

  static const Radius rSm = Radius.circular(sm);
  static const Radius rMd = Radius.circular(md);
  static const Radius rLg = Radius.circular(lg);
  static const Radius rXl = Radius.circular(xl);

  static const BorderRadius card = BorderRadius.all(rLg);
  static const BorderRadius button = BorderRadius.all(rMd);
  static const BorderRadius chip = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius sheet =
      BorderRadius.vertical(top: Radius.circular(xl));
}
