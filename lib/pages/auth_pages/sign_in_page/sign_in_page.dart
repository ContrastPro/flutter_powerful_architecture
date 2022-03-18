import 'package:file_structure_flutter/pages/main_page.dart';
import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_images.dart';
import 'package:file_structure_flutter/widgets/buttons/custom_button.dart';
import 'package:file_structure_flutter/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const routeName = '/auth_pages/sign_in';

  void _navigateToPage(BuildContext context, String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }

  Future<void> _testLocalAuth(BuildContext context) async {
    _navigateToPage(context, MainPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120.0,
          bottom: 60.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 185.0,
              child: Image.asset(
                AppImages.wing,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Discover\nBest Dates\nTo Fly',
                    style: TextStyle(
                      fontSize: 54.0,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Booking and saving made easy',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    CustomButton(
                      title: 'Войти',
                      onTap: () => _testLocalAuth(context),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    CustomTextButton(
                      title: 'Продолжить без авторизации',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      onTap: () => _navigateToPage(
                        context,
                        MainPage.routeName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
