import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp), label: 'Wawasan'),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/kritiksaran.png')),
          label: 'Kritik & Saran',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }
}
