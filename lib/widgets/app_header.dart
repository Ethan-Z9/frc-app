import 'package:flutter/material.dart';
import 'user_menu/user_menu.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final bool isLoggedIn;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;

  const AppHeader({
    super.key,
    required this.onMenuPressed,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.isLoggedIn,
    required this.onLogin,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    final height = AppBar().preferredSize.height + padding;

    return Container(
      height: height,
      padding: EdgeInsets.only(top: padding),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.white, Colors.blue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onMenuPressed,
              ),
              const SizedBox(width: 8),
              const Text(
                'FRC App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          UserMenu(
            isDarkMode: isDarkMode,
            toggleDarkMode: toggleDarkMode,
            isLoggedIn: isLoggedIn,
            onLogin: onLogin,
            onSignOut: onSignOut,
          ),
        ],
      ),
    );
  }
}