import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_icons.dart';
import 'package:file_structure_flutter/widgets/uncategorized/splash_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.radius = 10.0,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final double radius;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 60.0,
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
          ).copyWith(
            left: 30.0,
            right: 12.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.scaffold,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                AppIcons.next,
              ),
            ],
          ),
        ),
        SplashBox(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
        ),
      ],
    );
  }
}
