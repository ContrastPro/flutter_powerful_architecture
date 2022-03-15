import 'package:file_structure_flutter/pages/main_page.dart';
import 'package:file_structure_flutter/widgets/buttons/custom_text_button.dart';
import 'package:file_structure_flutter/widgets/uncategorized/system_overlay.dart';
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
    return SystemOverlay(
      statusBarIconBrightness: Brightness.dark,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'SignInPage',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextButton(
              title: 'Войти',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              onTap: () => _testLocalAuth(context),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextButton(
              title: 'Продолжить без авторизации',
              style: const TextStyle(
                fontSize: 14.0,
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
    );
  }
}
