import 'dart:async';

import 'package:file_structure_flutter/database/local_database.dart';
import 'package:file_structure_flutter/models/users/user_model.dart';
import 'package:file_structure_flutter/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:file_structure_flutter/pages/main_page.dart';
import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_images.dart';
import 'package:file_structure_flutter/widgets/animations/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _setInitialData();
    super.initState();
  }

  void _setInitialData() {
    Timer(
      const Duration(milliseconds: 3000),
      () {
        final UserModel user = LocalDB.instance.getUser();
        final String? accessToken = user.accessToken;
        final String? refreshToken = user.refreshToken;

        if (refreshToken == null || accessToken == null) {
          return _navigateToPage(SignInPage.routeName);
        }

        if (JwtDecoder.isExpired(refreshToken)) {
          /*context.read<AuthBloc>().add(
                  Logout(),
                );*/

          return _navigateToPage(SignInPage.routeName);
        }

        return _navigateToPage(MainPage.routeName);
      },
    );
  }

  void _navigateToPage(String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInAnimation(
        duration: const Duration(
          milliseconds: 2000,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250.0,
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Powerful architecture',
              style: TextStyle(
                fontSize: 26.0,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
