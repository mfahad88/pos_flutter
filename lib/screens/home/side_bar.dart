import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Function(String value)? onTap;
  const SideBar({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: onTap!('Home'),
        ),
        ListTile(
          title: const Text('Sales'),
          onTap: onTap!('Sales'),
        ),
        ListTile(
          title: const Text('Inventory'),
          onTap: onTap!('Inventory'),
        ),
        ListTile(
          title: const Text('Report'),
          onTap: onTap!('Report'),
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: onTap!('Logout'),

        )
      ],
    );
  }
}
