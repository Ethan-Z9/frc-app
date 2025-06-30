import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(String) onNavigate;

  const AppDrawer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.grey, Colors.blue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/FRCLogo2.png',
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Dashboard', context),
          _buildDrawerItem(Icons.edit, 'Match Scout', context),
          _buildDrawerItem(Icons.warehouse, 'Pit Scout', context),
          _buildDrawerItem(Icons.visibility, 'Analyze', context),
          _buildDrawerItem(Icons.compare, 'Compare', context),
          _buildDrawerItem(Icons.download, 'Export Data', context),
          _buildDrawerItem(Icons.upload_file, 'Import Data', context),
          _buildDrawerItem(Icons.settings, 'Settings', context),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop(); // Close the drawer
        onNavigate(label); // Trigger callback
      },
    );
  }
}
