import 'package:flutter/material.dart';
import 'home/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _handleLogin() {
    // Add your login logic here
  }

  void _handleSignOut() {
    // Add your sign-out logic here
  }

  void _handleNavigation(String route) {
    // Add navigation logic here
    debugPrint('Navigating to: $route');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FRC App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomePage(
        isDarkMode: _isDarkMode,
        toggleDarkMode: toggleDarkMode,
        onLogin: _handleLogin,
        onSignOut: _handleSignOut,
      ),
    );
  }
}