import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';

class FilterTile extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final Widget? trailing;
  const FilterTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: onSurface,
        child: Icon(icon, color: whiteColor, size: 18),
      ),
      title: title,
      trailing:
          trailing ??
          Icon(CupertinoIcons.chevron_down, size: 18, color: onSurface),
    );
  }
}
