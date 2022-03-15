import 'package:file_structure_flutter/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:file_structure_flutter/pages/auth_pages/sign_in_page/sign_in_page.dart';
import 'package:file_structure_flutter/pages/profile_pages/profile_page/profile_page.dart';
import 'package:file_structure_flutter/pages/tickets_pages/tickets_page/ticket_page.dart';
import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/utils/helpers.dart';
import 'package:file_structure_flutter/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: ColoredBox(
        color: AppColors.scaffold,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(
            top: 24.0,
            bottom: 42.0,
          ),
          child: SafeArea(
            child: Column(
              children: [
                if (!isAuthorized()) ...[
                  const Expanded(
                    child: _NoAuthMenu(),
                  ),
                ] else ...[
                  const Expanded(
                    child: _AuthMenu(),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NoAuthMenu extends StatelessWidget {
  const _NoAuthMenu({Key? key}) : super(key: key);

  void _navigateToPage(BuildContext context, String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Для использования всех возможностей системы необходимо войти или зарегистрироваться',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16.0,
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextButton(
              title: 'Вход',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              onTap: () => _navigateToPage(
                context,
                SignInPage.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthMenu extends StatelessWidget {
  const _AuthMenu({Key? key}) : super(key: key);

  void _navigateToPage(
    BuildContext context, {
    required int index,
    required String route,
  }) {
    Navigator.pop(context);

    context.read<NavigationBloc>().add(
          NavigateMenu(
            menuIndex: index,
            route: route,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Вы авторизированы',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16.0,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomTextButton(
                  title: 'Вход',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () => _navigateToPage(
                    context,
                    route: TicketsPage.routeName,
                    index: 0,
                  ),
                ),
                CustomTextButton(
                  title: 'Вход',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () => _navigateToPage(
                    context,
                    route: ProfilePage.routeName,
                    index: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
