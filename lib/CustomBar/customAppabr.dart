// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Customappabr extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Customappabr({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.indigo,
    );
  }
}
