import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool visibleActions;
  const AppBarCustom({
    Key? key,
    required this.title,
    this.visibleActions = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      actions: [],
      // actions: !visibleActions ? _actions(context) : [],
    );
  }

  _actions(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
        icon: const Icon(
          Icons.manage_accounts,
        ),
      )
    ];
  }
}
