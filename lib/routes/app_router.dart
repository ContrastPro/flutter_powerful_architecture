import 'package:file_structure_flutter/pages/audio_pages/audio_page/audio_page.dart';
import 'package:file_structure_flutter/pages/profile_pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    WidgetBuilder builder;

    switch (settings.name) {
      case AudioPage.routeName:
        final AudioPageArguments args = arguments as AudioPageArguments;
        builder = (_) => AudioPage(
              id: args.id,
              name: args.name,
            );
        break;
      case ProfilePage.routeName:
        final int? args = arguments as int?;
        builder = (_) => ProfilePage(
              id: args,
            );
        break;

      case HomePage.routeName:
        builder = (_) => HomePage();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
