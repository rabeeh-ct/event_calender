import 'package:event_calender/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class EventDetailItem extends StatelessWidget {
  const EventDetailItem({super.key, required this.iconData, required this.title, required this.trailing});
  final IconData iconData;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(iconData),
        10.sBW,
        Text(title),
        20.sBW,
        const Spacer(),
        Text(
          trailing,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
