import 'package:flutter/material.dart';
import 'package:wallet_prototype/screens/home_screen.dart';
import 'package:wallet_prototype/screens/profile_screen.dart';
import 'package:wallet_prototype/screens/wallet_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = selectedPage==0? const HomeScreen():selectedPage==1?const WalletScreen():const ProfileScreen();
    return Scaffold(
      body: currentScreen,
      backgroundColor: const Color.fromARGB(255, 245, 245, 243),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels:false,
        currentIndex: selectedPage,
        onTap: (g) => setState(() {
          selectedPage = g;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.analytics_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: ''),
        ],
      ),
    );
  }
}
