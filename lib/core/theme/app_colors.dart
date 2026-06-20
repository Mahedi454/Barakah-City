import 'package:flutter/material.dart';

/// Barakah City color tokens.
///
/// Palette philosophy: green (growth), gold (prosperity), soft neutrals (calm).
/// No harsh reds — the game should feel peaceful and ethical. Even "warnings"
/// are warm terracotta, never alarm-red.
///
/// Layers: brand · surfaces/neutrals · text · resource semantics · status.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand / Core
  // ---------------------------------------------------------------------------
  static const Color green = Color(0xFF2E7D52); // primary — growth, nature
  static const Color greenDeep = Color(0xFF205C3B); // pressed / shadow on green
  static const Color greenLight = Color(0xFF5FA877); // highlights, success
  static const Color greenMist = Color(0xFFDCEBE0); // tinted bg, selected chips

  static const Color gold = Color(0xFFD9A441); // secondary — prosperity, value
  static const Color goldDeep = Color(0xFFB5852C); // gold pressed / border lip
  static const Color goldSoft = Color(0xFFF3E2BC); // reward bg, coin pills

  // ---------------------------------------------------------------------------
  // Surfaces / Neutrals
  // ---------------------------------------------------------------------------
  static const Color cream = Color(0xFFF6F1E7); // app background (base canvas)
  static const Color sand = Color(0xFFEADFC8); // panels, raised cards, tray
  static const Color sandDeep = Color(0xFFD9CBB0); // card borders, dividers
  static const Color sky = Color(0xFFAFD3E2); // sky gradient top, water motifs
  static const Color skySoft = Color(0xFFE3F1F6); // info backgrounds
  static const Color surfaceWhite = Color(0xFFFFFDF8); // card faces (warm white)

  // ---------------------------------------------------------------------------
  // Text & Lines
  // ---------------------------------------------------------------------------
  static const Color textDark = Color(0xFF2B2B2B); // primary text (never #000)
  static const Color textMuted = Color(0xFF6B6B6B); // secondary / captions
  static const Color textOnBrand = Color(0xFFFFFFFF); // text on green/gold
  static const Color hairline = Color(0x14000000); // 8% black dividers

  // ---------------------------------------------------------------------------
  // Resource semantics — each resource owns ONE hue for pre-attentive scanning.
  // ---------------------------------------------------------------------------
  static const Color coin = gold; // Coins — gold
  static const Color population = Color(0xFF3E8E7E); // Population — teal-green
  static const Color happiness = Color(0xFFE8A93B); // Happiness — warm amber
  static const Color water = Color(0xFF5FA8C7); // Water — calm blue
  static const Color education = Color(0xFF7A6CB5); // Education — soft indigo

  // ---------------------------------------------------------------------------
  // Status (peaceful — no red)
  // ---------------------------------------------------------------------------
  static const Color positive = greenLight; // success
  static const Color caution = gold; // "needs attention", not danger
  static const Color critical = Color(0xFFC97B5A); // terracotta — warmest alert
  static const Color disabled = Color(0xFFBDB7A8); // neutral / locked
}
