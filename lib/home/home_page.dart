// lib/home/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.onLogin,
    required this.onSignOut,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;

  void _handleLogin() {
    widget.onLogin();
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _handleSignOut() {
    widget.onSignOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onNavigate: (String page) {
          // Handle navigation
        },
      ),
      body: Column(
        children: [
          AppHeader(
            isDarkMode: widget.isDarkMode,
            toggleDarkMode: widget.toggleDarkMode,
            isLoggedIn: _isLoggedIn,
            onLogin: _handleLogin,
            onSignOut: _handleSignOut,
          ),
          const Expanded(
            child: Center(
              child: Text('Main content goes here'),
            ),
          ),
        ],
      ),
    );
  }
}
