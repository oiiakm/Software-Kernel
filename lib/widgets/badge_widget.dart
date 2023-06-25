import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeWidget extends StatelessWidget {
  final Widget icon;
  final int count;

  const BadgeWidget({
    Key? key,
    required this.icon,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        count > 0 ? count.toString() : '',
        style: const TextStyle(color: Colors.white),
      ),
      badgeColor: Colors.red,
      position: badges.BadgePosition.topEnd(top: -12, end: -12),
      child: icon,
    );
  }
}
