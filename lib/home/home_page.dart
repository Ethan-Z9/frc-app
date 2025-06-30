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
          Center(
            child: SystemClock(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left sponsor box
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    margin: const EdgeInsets.only(left:5, top: 0, bottom:25),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text('Sponsor Logo?'),
                      ),
                    ),
                  ),

                  // Center dashboard
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.7,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Future Dashboard',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  // Right sponsor box
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    margin: const EdgeInsets.only(right:5, top: 0, bottom:25),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('Sponsor Logo?'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
