// lib/app.dart
import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/match_scout_page.dart';
import 'pages/pit_scout_page.dart';
import 'pages/analyze_page.dart';
import 'pages/compare_page.dart';
import 'pages/export_page.dart';
import 'pages/import_page.dart';
import 'pages/settings_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDarkMode = false;
  String _currentPageTitle = 'Dashboard';
  Widget _currentPage = const DashboardPage();

  void toggleDarkMode() {
    setState(() => _isDarkMode = !_isDarkMode);
  }

  void _handleLogin() {
    // implement login later
  }

  void _handleSignOut() {
    // implement sign-out later
  }

  void _handleNavigation(String route) {
    setState(() {
      _currentPageTitle = route;
      switch (route) {
        case 'Dashboard':
          _currentPage = const DashboardPage();
          break;
        case 'Match Scout':
          _currentPage = const MatchScoutPage();
          break;
        case 'Pit Scout':
          _currentPage = const PitScoutPage();
          break;
        case 'Analyze':
          _currentPage = const AnalyzePage();
          break;
        case 'Compare':
          _currentPage = const ComparePage();
          break;
        case 'Export Data':
          _currentPage = const ExportPage();
          break;
        case 'Import Data':
          _currentPage = const ImportPage();
          break;
        case 'Settings':
          _currentPage = const SettingsPage();
          break;
        default:
          _currentPage = const Center(child: Text('Page Not Found'));
          _currentPageTitle = 'Not Found';
      }
    });
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
        onNavigate: _handleNavigation,
        currentPage: _currentPage,
        pageTitle: _currentPageTitle,
        pageContent: _currentPage,
      ),
    );
  }
}
