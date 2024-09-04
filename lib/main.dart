import 'package:flutter/material.dart';

import 'function_to_parse_json.dart';
import 'inputs.dart';
import 'model_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonGridView(),
    );
  }
}

class JsonGridView extends StatefulWidget {
  @override
  _JsonGridViewState createState() => _JsonGridViewState();
}

class _JsonGridViewState extends State<JsonGridView> {
  List<AndroidVersion?> versions = [];

  void updateGrid(List<AndroidVersion?> parsedVersions) {
    setState(() {
      versions = parsedVersions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter JSON Parsing Task'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  List<AndroidVersion?> parsedVersions = parseJson(input1);
                  updateGrid(parsedVersions);
                },
                child: Text('Display Input 1'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  List<AndroidVersion?> parsedVersions = parseJson(input2);
                  updateGrid(parsedVersions);
                },
                child: Text('Display Input 2'),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 4, // Number of columns in grid
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: versions.length,
              itemBuilder: (context, index) {
                final version = versions[index];
                if (version == null) {
                  return Container(); // Empty container for missing indices
                }
                return Card(
                  elevation: 4,
                  child: Center(
                    child: Text(
                      version.title ?? '',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}