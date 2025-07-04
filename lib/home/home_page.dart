// lib/home/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';
import '../widgets/system_clock.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final VoidCallback onLogin;
  final VoidCallback onSignOut;
  final Function(String) onNavigate;
  final String pageTitle;
  final Widget pageContent;
  final Widget currentPage;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.onLogin,
    required this.onSignOut,
    required this.onNavigate,
    required this.pageTitle,
    required this.pageContent,
    required this.currentPage,
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
        onNavigate: widget.onNavigate,
      ),
      body: Column(
        children: [
          AppHeader(
            title: widget.pageTitle,
            isDarkMode: widget.isDarkMode,
            toggleDarkMode: widget.toggleDarkMode,
            isLoggedIn: _isLoggedIn,
            onLogin: _handleLogin,
            onSignOut: _handleSignOut,
          ),
          const Center(child: SystemClock()),
          Expanded(child: widget.currentPage),
        ],
      ),
    );
  }
}
