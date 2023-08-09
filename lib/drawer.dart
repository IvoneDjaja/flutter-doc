import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List'),
            onTap: () {
              context.go('/list');
            },
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('Font'),
            onTap: () {
              context.go('/font');
            },
          ),
        ],
      ),
    );
  }
}
