import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left sponsor box
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  margin: const EdgeInsets.only(left: 15, top: 0, bottom: 25),
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
                  margin: const EdgeInsets.only(right: 15, top: 0, bottom: 25),
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
    );
  }
}
