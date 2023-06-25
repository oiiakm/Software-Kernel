import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final VoidCallback incrementCount;
  final VoidCallback decrementCount;
  final int counter;

  const FavoritesPage({
    Key? key,
    required this.incrementCount,
    required this.decrementCount,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color.fromARGB(255, 211, 85, 92),
        elevation: 2.0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: incrementCount,
              child: const Text('Increase Count'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: decrementCount,
              child: const Text('Decrease Count'),
            ),
          ],
        ),
      ),
    );
  }
}
