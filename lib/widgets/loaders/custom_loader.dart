import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: SpinKitChasingDots(
          size: 50.0,
          color: AppColors.primary.withOpacity(0.8),
        ),
      ),
    );
  }
}
