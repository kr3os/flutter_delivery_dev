import 'package:delivery_app/global/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/components/my_drawer_tile.dart';

import 'package:delivery_app/screens/settings/settings_core.dart';
import 'package:delivery_app/screens/savings/savings_core.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async {
    final authService = AuthService();

    await authService.signOut(); 
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          /// App Logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          /// Home List Tile
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          /// Home List Tile
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const SettingsScreen())
              );
            },
          ),
          MyDrawerTile(
            text: 'S A V I N G',
            icon: Icons.eco,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const SavingScreen())
              );
            },
          ),

          const Spacer(),

          /// logout List Tile
          MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.home,
            onTap: logout
          ),

          const SizedBox(height: 25,)

          /// Logout 
          /// 
        ],
      ),
    );
  }
}