import 'package:flutter/material.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.menu_book,
              color: Colors.grey[600],
            ),
            label: "BOOK",
            selectedIcon: Icon(
              Icons.menu_book,
              color: Colors.grey[900],
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.restaurant,
              color: Colors.grey[600],
            ),
            label: "MEAL",
            selectedIcon: Icon(
              Icons.restaurant,
              color: Colors.grey[900],
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.park,
              color: Colors.grey[600],
            ),
            label: "WALK",
            selectedIcon: Icon(
              Icons.park,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}
