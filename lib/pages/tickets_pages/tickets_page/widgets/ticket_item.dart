import 'package:file_structure_flutter/pages/tickets_pages/ticket_details_page/ticket_details_page.dart';
import 'package:flutter/material.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        TicketDetailsPage.routeName,
        arguments: TicketDetailsPageArguments(
          index: index,
          title: 'Item ${index + 1}',
        ),
      ),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.only(
          left: 16.0,
        ),
        alignment: Alignment.centerLeft,
        color: Colors.blue[100 * (index % 9)],
        child: Text(
          'Item ${index + 1}',
        ),
      ),
    );
  }
}
