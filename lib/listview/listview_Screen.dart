import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/listview/listview_Screen_Model.dart';

class ListViewS extends StatelessWidget {
  const ListViewS({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    DialogB(ListViewM value) {
      late String name;
      late String Des;
      final _formKey = GlobalKey<FormState>();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'What is your name?',
                      labelText: 'Name *',
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'What is your distination?',
                      labelText: 'Description *',
                    ),
                    onChanged: (value) {
                      Des = value;
                    },
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        value.incrementAge(name, Des);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return ChangeNotifierProvider(
      create: (_) => ListViewM(),
      child: Consumer<ListViewM>(
        builder: (context, value, child) => Scaffold(
          body: ListViewBuilder(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              DialogB(value);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

// class DialogB extends StatelessWidget {
//   DialogB({super.key, required this.value});
//   ListViewM value;
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) async {
//     return await showDialog(
//         context: context,
//         builder: (context) {
//           return
//         });
//   }
// }

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({
    super.key,
  });
  // required this.value
  //ListViewM value;
  @override
  Widget build(BuildContext context) {
    return Consumer<ListViewM>(
      builder: (context, value, child) => ListView.builder(
          itemCount: value.name.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTileB(
              index: index,
            );
          }),
    );
  }
}

class ListTileB extends StatelessWidget {
  ListTileB({
    super.key,
    required this.index,
  });
  int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ListViewM>(
      builder: (context, value, child) => ListTile(
        title: Text(value.name[index]),
        subtitle: Text(value.desc[index]),
      ),
    );
  }
}
