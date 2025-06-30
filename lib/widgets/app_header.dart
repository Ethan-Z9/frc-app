// lib/widgets/app_header.dart
import 'package:flutter/material.dart';
import 'user_menu/user_menu.dart';

class AppHeader extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;
  final bool isLoggedIn;

  const AppHeader({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.onLogin,
    required this.onSignOut,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(top: padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xffe20c10), // Red
            Color(0xffea3c3f),
            Color(0xfff26c6e),
            Color(0xfff99c9c),
            Color(0xffffcaca),
            Color(0xffffe4e4),
            Color(0xffffffff),// White
            Color(0xffffffff),// White
            Color(0xffd0e4f4),
            Color(0xffa1caea),
            Color(0xff72afe0),
            Color(0xff4395d6),
            Color(0xff247bc5),
            Color(0xff005fa8), // Blue
            ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          const Text(
            '639 Code Red Robotics',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: UserMenu(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleDarkMode,
              onLogin: onLogin,
              onSignOut: onSignOut,
              isLoggedIn: isLoggedIn,
            ),
          ),
        ],
      ),
    );
  }
}
