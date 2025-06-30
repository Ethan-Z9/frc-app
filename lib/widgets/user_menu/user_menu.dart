// lib/widgets/user_menu/user_menu.dart
import 'package:flutter/material.dart';

class UserMenu extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;
  final bool isLoggedIn;

  const UserMenu({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onLogin,
    required this.onSignOut,
    required this.isLoggedIn,
  });

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  final GlobalKey _menuKey = GlobalKey();

  void _showCustomMenu() async {
    final RenderBox button = _menuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero);

    await showMenu<void>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height,
        position.dx + button.size.width,
        position.dy,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          enabled: false,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.light_mode),
                  Switch(
                    value: widget.isDarkMode,
                    onChanged: (value) {
                      widget.onToggleTheme();
                      setState(() {});
                    },
                  ),
                  const Icon(Icons.dark_mode),
                ],
              );
            },
          ),
        ),
        const PopupMenuDivider(),
        widget.isLoggedIn
            ? PopupMenuItem(
                onTap: widget.onSignOut,
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Sign Out'),
                  ],
                ),
              )
            : PopupMenuItem(
                onTap: widget.onLogin,
                child: const Row(
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text('Login'),
                  ],
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _menuKey,
      icon: const Icon(Icons.person),
      onPressed: _showCustomMenu,
    );
  }
}
