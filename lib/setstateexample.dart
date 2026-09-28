import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summerofcode_ext/counterapp_provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    // final object = Provider.of<CounterappProvider>(context);
    print('rebuild');
    return Scaffold(
      body: Center(
        child: Consumer<CounterappProvider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            );
          },
        ),
      ),
      floatingActionButton: Consumer<CounterappProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              value.increment();
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
