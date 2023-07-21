import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int total = 0;
  var dataJSon;

  void _getDataFromStrapi() async {
    var response =
        await http.get(Uri.parse("http://localhost:1337/api/mahasiswas"));
    dataJSon = await jsonDecode(response.body);
    print(dataJSon["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJSon["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: total,
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text(dataJSon["data"][index]["attributes"]["nama_mahasiswa"]),
              leading: Icon(Icons.add_home),
              trailing: IconButton(
                  onPressed: () async {
                    var id = dataJSon["data"][index]["id"];
                    var response = await http.delete(
                        Uri.parse("http://localhost:1337/api/mahasiswas/$id"));
                    _getDataFromStrapi();
                  },
                  icon: Icon(Icons.delete)),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: _getDataFromStrapi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
