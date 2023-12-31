import 'package:flutter/material.dart';
import 'package:walkmoment/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onWalkTap;
  final void Function()? onMealTap;
  final void Function()? onBookTap;
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onWalkTap,
    required this.onMealTap,
    required this.onBookTap,
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
              MyListTile(
                icon: Icons.checkroom,
                text: "C L O T H E S",
                onTap: onMealTap,
              ),
              MyListTile(
                icon: Icons.restaurant,
                text: "M E A L",
                onTap: onBookTap,
              ),
              // home list tile
              MyListTile(
                icon: Icons.cloud,
                text: "C L O U D",
                onTap: onWalkTap,
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
