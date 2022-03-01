import 'package:badges/badges.dart';
import 'package:crypto_pricelist_test/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: AppColor.red,
      shape: BadgeShape.square,
      position: const BadgePosition(top: 0, end: -8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      borderRadius: BorderRadius.circular(8),
      badgeContent: const Text(
        '15',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
      ),
      child: const Icon(
        Icons.notifications_none_sharp,
        size: 30,
      ),
    );
  }
}
