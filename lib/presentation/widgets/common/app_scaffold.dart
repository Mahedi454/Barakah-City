import 'package:flutter/material.dart';

import 'ambient_background.dart';

/// Standard screen shell: the ambient gradient backdrop plus a transparent
/// [Scaffold] so the world shows through. Use this instead of a bare Scaffold
/// for any Barakah City screen.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomBar,
    this.extendBodyBehindAppBar = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomBar;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return AmbientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
