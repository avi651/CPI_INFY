import 'package:flutter/material.dart';

class CIPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? title;
  final double? height;

  const CIPAppBar({
    super.key,
    this.backgroundColor = Colors.purple,
    this.title = '',
    this.height: kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }
}