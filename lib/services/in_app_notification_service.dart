import 'package:bot_toast/bot_toast.dart';
import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum InAppNotificationType { info, warning, error }

class InAppNotification {
  const InAppNotification._();

  static Color _notificationColor(InAppNotificationType type) {
    if (type == InAppNotificationType.warning) return Colors.orangeAccent;
    if (type == InAppNotificationType.error) return Colors.redAccent;
    return Colors.white;
  }

  static Color _notificationColorText(InAppNotificationType type) {
    if (type == InAppNotificationType.info) return Colors.black54;
    return Colors.white;
  }

  static Color _notificationColorIcon(InAppNotificationType type) {
    if (type == InAppNotificationType.info) return AppColors.primary;
    return Colors.white;
  }

  static String _notificationIcon(InAppNotificationType type) {
    if (type == InAppNotificationType.warning) return AppIcons.close;
    if (type == InAppNotificationType.error) return AppIcons.close;
    return AppIcons.check;
  }

  static void show({
    String title = 'Info message',
    InAppNotificationType type = InAppNotificationType.info,
  }) {
    BotToast.showCustomNotification(
      onlyOne: true,
      duration: const Duration(
        seconds: 3,
      ),
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      toastBuilder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: _notificationColor(type),
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 3.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  _notificationIcon(type),
                  color: _notificationColorIcon(type),
                  width: 16.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _notificationColorText(type),
                    //color: AppColors.textPrimary,
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
