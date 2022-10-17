import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/Example/Example_Screen_Model.dart';
import 'package:providers/Example/color.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExampleModel(),
      child: Consumer<ExampleModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueGrey,
          ),
          backgroundColor: bgc[value!.rand],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 75),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: value.incrementAge,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
