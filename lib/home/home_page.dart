import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;

  void _handleLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _handleSignOut() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Builder(
        builder: (context) => Column(
          children: [
            AppHeader(
              onMenuPressed: () => Scaffold.of(context).openDrawer(),
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
      ),
    );
  }
}