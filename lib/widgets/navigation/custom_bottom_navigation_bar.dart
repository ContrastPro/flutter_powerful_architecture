import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentTab,
    required this.onSelect,
  }) : super(key: key);

  final int currentTab;
  final void Function(int) onSelect;

  static const List<_BottomNavigationBarItem> _items = [
    _BottomNavigationBarItem(
      iconPath: AppIcons.ticket,
      title: 'Билеты',
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.profile,
      title: 'Профиль',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: kBottomNavigationBarHeight,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom / 2,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: AppColors.secondary.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items.map((e) {
          final int i = _items.indexOf(e);

          return Flexible(
            child: SizedBox(
              width: double.infinity,
              height: kBottomNavigationBarHeight,
              child: Material(
                color: AppColors.scaffold,
                child: InkWell(
                  onTap: () => onSelect(i),
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        e.iconPath,
                        color: i == currentTab
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        e.title,
                        style: TextStyle(
                          color: i == currentTab
                              ? AppColors.textSecondary
                              : AppColors.textPrimary,
                          fontSize: 11.0,
                          height: 1.18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _BottomNavigationBarItem {
  const _BottomNavigationBarItem({
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;
}
