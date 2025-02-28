import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> moviePosters = [
      'assets/images/image2.png',
      'assets/images/image5.png',
      'assets/images/image8.png',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Listem')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: moviePosters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(moviePosters[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
