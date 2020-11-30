import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("RiverPod Test"),
        ),
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final incrementNotifier = watch(incrementProvider);
              return Text(incrementNotifier.value.toString());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(incrementProvider).increment();
          },
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
