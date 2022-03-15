import 'package:file_structure_flutter/resources/app_colors.dart';
import 'package:file_structure_flutter/resources/app_icons.dart';
import 'package:file_structure_flutter/widgets/navigation/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  static const routeName = '/tickets_pages/ticket_details';

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: SvgPicture.asset(
          AppIcons.close,
          color: AppColors.textPrimary,
        ),
        onLeading: () => Navigator.pop(context),
      ),
      body: Center(
        child: Text(
          'TicketDetailsPage: $index',
        ),
      ),
    );
  }
}
