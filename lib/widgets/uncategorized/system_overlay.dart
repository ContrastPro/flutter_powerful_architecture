import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemOverlay extends StatelessWidget {
  const SystemOverlay({
    Key? key,
    this.statusBarColor,
    this.statusBarIconBrightness,
    required this.child,
  }) : super(key: key);

  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      child: child,
    );
  }
}
