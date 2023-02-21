import 'package:flutter/material.dart';

import 'api_call/get.dart';
import 'main.dart';
import 'models/model.dart';

class Ui extends StatefulWidget {
  const Ui({Key? key}) : super(key: key);

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {

  void initState() {
    super.initState();
    model = fetchData();
  }
  late Future<Model> model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
      ),
      body:Center(
        child: FutureBuilder<Model>(
          future:model,
          builder: (context, snapshot) {
            return Scrollbar(
              child: ListView.builder(
                itemCount:snapshot.data?.articles?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${snapshot.data?.articles![index].title}'),
                  );
                },

              ),
            );
          }
    ),
    ),
    );
  }
}
