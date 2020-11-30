import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:reiverpodtest_app/model/model.dart';
import 'package:reiverpodtest_app/state/state_manager.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

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
              final responseAsyncValue = watch(photostateFuture);
              return responseAsyncValue.map(
                data: (value) {
                  return ListView.builder(
                    itemCount: value.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(value.value[index].url)),
                        title: Text(value.value[index].title),
                      );
                    },
                  );
                },
                loading: (_) => CircularProgressIndicator(),
                error: (_) => Text(
                  _.error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
