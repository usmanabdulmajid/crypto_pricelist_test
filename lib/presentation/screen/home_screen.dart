import 'package:crypto_pricelist_test/presentation/component/custom_bottom_nav.dart';
import 'package:crypto_pricelist_test/presentation/component/notification_badge.dart';
import 'package:crypto_pricelist_test/presentation/screen/history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HistoryScreen(),
          Center(child: Text('Explore')),
          Center(child: Text('Notification')),
          Center(child: Text('profile')),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        items: const [
          Icon(Icons.equalizer),
          Icon(Icons.language),
          NotificationBadge(),
          Icon(CupertinoIcons.person),
        ],
        onChange: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
