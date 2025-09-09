import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center_outlined),
      label: 'Exercises',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.flag_circle_outlined),
      label: 'Goals',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.analytics_outlined),
      label: 'activity',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xff973ec2),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
