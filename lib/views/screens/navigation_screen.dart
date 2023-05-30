import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint/utils/styles.dart';
import 'package:moniepoint/views/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            if (index == 0) {
              _currentIndex = index;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_home.svg',
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_ticket.svg',
              ),
              label: 'Voucer'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_wallet.svg',
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_setting.svg',
              ),
              label: 'Settings'),
        ],
        selectedLabelStyle: AppStyles.boldText.copyWith(color: Colors.black),
        unselectedLabelStyle: AppStyles.semiBoldText.copyWith(
          color: Colors.grey,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
