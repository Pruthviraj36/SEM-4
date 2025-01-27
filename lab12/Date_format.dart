import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dateformat extends StatelessWidget {
  const Dateformat({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now(); // Declare as a final variable inside the build method

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Formats'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('dd/MM/yyyy').format(currentDate),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              DateFormat('dd-MM-yyyy').format(currentDate),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              DateFormat('dd-MMM-yyyy').format(currentDate),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              DateFormat('dd-MM-yy').format(currentDate),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              DateFormat('dd MMM, yyyy').format(currentDate),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
