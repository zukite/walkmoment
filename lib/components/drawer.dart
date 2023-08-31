import 'package:flutter/material.dart';
import 'package:walkmoment/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // header
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),
              // home list tile
              MyListTile(
                icon: Icons.park,
                text: "W A L K",
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                icon: Icons.restaurant,
                text: "E A T",
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                icon: Icons.menu_book,
                text: "B O O K",
                onTap: () => Navigator.pop(context),
              ),
              // profile list tile
              MyListTile(
                icon: Icons.person,
                text: "P R O F I L E",
                onTap: onProfileTap,
              ),
              // logout list tile
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: "L O G O U T",
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
