import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final bool isLoggedIn;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;

  const UserMenu({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.isLoggedIn,
    required this.onLogin,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return PopupMenuButton<int>(
      icon: const Icon(Icons.person),
      offset: const Offset(0, kToolbarHeight),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          enabled: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(color: textColor),
              ),
              Switch(
                value: isDarkMode,
                onChanged: (val) {
                  Navigator.pop(context); // Close the menu
                  toggleDarkMode();
                },
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<int>(
          value: isLoggedIn ? 1 : 2,
          child: Text(
            isLoggedIn ? 'Sign Out' : 'Login',
            style: TextStyle(color: textColor),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          onSignOut();
        } else if (value == 2) {
          onLogin();
        }
      },
    );
  }
}
