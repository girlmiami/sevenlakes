import 'package:flutter/material.dart';

import 'function.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.width,
    required this.length,
    required this.height,
    required this.mass,
    required this.densityOption,
  }) : super(key: key);
  final String title;
  final double length;
  final double height;
  final double width;
  final double mass;
  final String densityOption;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var computedList = [];

  @override
  Widget build(BuildContext context) {
    var input1 = [
      {"name": "mass", "type": "number", "value": widget.mass},
      {"name": "length", "type": "number", "value": widget.length},
      {"name": "width", "type": "number", "value": widget.width},
      {"name": "height", "type": "number", "value": widget.height},
      {"name": "densityOption", "type": "string", "value": widget.densityOption}
    ];
    var inputToCompute = [
      {"name": "volume", "expression": "length * width * height"},
      {
        "name": "density",
        "expression":
            "IIF(densityOption == 'specGravity', mass / (length * width * height * 0.9),	mass / (length * width * height) )"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "List of input attributes : ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${input1.toString()}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "List of to be computed attributes - attributes to be computed per expressions based on input attributes : ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${inputToCompute.toString()}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "List of computed attributes : ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${computedList.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  computedList = [];
                  setState(() {});
                },
                child: Text("Clear"),
              ),
            ),
          ),
          Container(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                computedList = function(
                  input1,
                  inputToCompute,
                );
                print(computedList);
                setState(() {});
              },
              child: Text("Compute"),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
