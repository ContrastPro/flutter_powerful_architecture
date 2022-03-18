import 'package:flutter/material.dart';

class GlowScrollIndicator extends StatelessWidget {
  const GlowScrollIndicator({
    Key? key,
    this.enabled = false,
    required this.child,
  }) : super(key: key);

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return ScrollConfiguration(
        behavior: _GlowBehavior(),
        child: child,
      );
    }

    return child;
  }
}

class _GlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(context, child, details) => child;
}
