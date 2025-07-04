// lib/widgets/app_header.dart
import 'package:flutter/material.dart';
import 'user_menu/user_menu.dart';

class AppHeader extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;
  final bool isLoggedIn;
  final String title; // NEW

  const AppHeader({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.onLogin,
    required this.onSignOut,
    required this.isLoggedIn,
    required this.title, // NEW
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(top: padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff6699CC),
            Color(0xff6699CC),
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
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
