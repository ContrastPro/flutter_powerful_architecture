import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_loader.dart';

class ActionLoader extends StatelessWidget {
  const ActionLoader({
    Key? key,
    required this.loading,
    required this.child,
    this.opacity = 0.85,
  }) : super(key: key);

  final bool loading;
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (loading) return false;
        return true;
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          if (loading)
            Container(
              color: AppColors.scaffold.withOpacity(opacity),
              child: const CustomLoader(),
            ),
        ],
      ),
    );
  }
}
