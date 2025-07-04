import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SystemClock extends StatefulWidget {
  const SystemClock({super.key});

  @override
  State<SystemClock> createState() => _SystemClockState();
}

class _SystemClockState extends State<SystemClock> {
  late String _hourMinute;
  late String _amPm;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('hh:mm a'); // 12-hour format with AM/PM
    final parts = formatter.format(now).split(' ');
    final timeParts = parts[0].split(':');

    setState(() {
      _hourMinute = '${timeParts[0]}:${timeParts[1]}';
      _amPm = parts[1];
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parts = _hourMinute.split(':');

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                parts[0],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                parts[1],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                _amPm,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
