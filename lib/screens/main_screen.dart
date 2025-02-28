import 'package:flutter/material.dart';
import 'download_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import 'myList_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MyListScreen(),
    const DownloadScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/house.png')),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/archive.png')),
            label: 'Listem',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/download.png')),
            label: 'İndirilenler',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
