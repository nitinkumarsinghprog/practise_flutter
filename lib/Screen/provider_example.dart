import 'package:flutter/material.dart';
import 'package:practise_flutter/Provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),

      body: Center(
        child: Consumer<Counterprovider>(
          builder: (context, counterProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 20),

                Text(
                  '${counterProvider.getCount()}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<Counterprovider>().increment();
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 10),

          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<Counterprovider>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}