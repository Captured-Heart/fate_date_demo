import 'package:fate_date_demo/core/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundedMainBtn extends StatelessWidget {
  const RoundedMainBtn({super.key, required this.message, required this.icon, required this.onTap});
  final String message;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSpacings.k16,
      child: Icon(
        icon,
        size: AppSpacings.k20,
      ),
    ).onTapWidget(onTap: onTap, tooltip: message);
  }
}
