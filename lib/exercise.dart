// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ExerciseLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Set dynamic padding based on screen width
    final padding = screenWidth > 600 ? 100.0 : 25.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
            children: [
              const Text(
                'Type of Exercise', // Title text
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Space between title and TextField
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter exercise',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Number of Sets', // Title text
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Space between title and TextField
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Number of Reps', // Title text
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Space between title and TextField
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
