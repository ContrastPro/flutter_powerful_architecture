import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_icons.dart';
import 'package:file_structure_flutter/services/in_app_notification_service.dart';
import 'package:file_structure_flutter/utils/helpers.dart';
import 'package:file_structure_flutter/widgets/loaders/action_loader.dart';
import 'package:file_structure_flutter/widgets/navigation/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile_pages/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _loading = false;

  void _switchLoading(bool status) {
    setState(() => _loading = status);
  }

  Future<void> _testRequest() async {
    _switchLoading(true);
    await localRequest();
    _switchLoading(false);

    InAppNotification.show(
      type: InAppNotificationType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActionLoader(
      loading: _loading,
      child: Scaffold(
        appBar: CustomAppBar(
          leading: SvgPicture.asset(
            AppIcons.menu,
            color: AppColors.textPrimary,
          ),
          onLeading: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        body: Center(
          child: InkWell(
            onTap: _testRequest,
            child: const Text(
              'ProfilePage',
            ),
          ),
        ),
      ),
    );
  }
}
