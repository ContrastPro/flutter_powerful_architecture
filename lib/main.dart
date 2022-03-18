import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_structure_flutter/database/local_database.dart';
import 'package:file_structure_flutter/pages/uncategorized/splash_screen_page/splash_screen_page.dart';
import 'package:file_structure_flutter/repositories/auth_repository.dart';
import 'package:file_structure_flutter/resources/app_locale.dart';
import 'package:file_structure_flutter/resources/app_themes.dart';
import 'package:file_structure_flutter/routes/app_router.dart';
import 'package:file_structure_flutter/widgets/uncategorized/system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void _errorHandler(Object error, StackTrace stack) {
  log(
    '\nError description: $error'
    '\nStackTrace:\n$stack',
    name: 'Error handler',
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalDB.instance.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runZonedGuarded(
    () {
      runApp(
        EasyLocalization(
          path: AppLocale.path,
          supportedLocales: AppLocale.supportedLocales,
          fallbackLocale: AppLocale.fallbackLocale,
          child: const _App(),
        ),
      );
    },
    _errorHandler,
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  static final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => _authRepository,
        ),
      ],
      child: SystemOverlay(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        child: MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          builder: BotToastInit(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          debugShowCheckedModeBanner: false,
          title: 'Powerful architecture',
          theme: AppThemes.light(),
          initialRoute: SplashScreenPage.routeName,
          onGenerateRoute: AppRouter.generateRoute,
          routes: {
            SplashScreenPage.routeName: (_) => const SplashScreenPage(),
          },
        ),
      ),
    );
  }
}
