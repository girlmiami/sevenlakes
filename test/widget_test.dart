import 'package:flutter_test/flutter_test.dart';
import 'package:sevenlakes/function.dart';

void main() {
  test('Testing Compute function in  MyApp page...', () async {
    List checkCompute() {
      var l = 6;
      var w = 7;
      var h = 8;
      var mass = 900;
      var densityOption = "specGravity";

      return [
        {"name": "volume", "value": l * w * h},
        {
          "name": "density",
          "value": densityOption == "specGravity"
              ? (mass / (l * w * h * 0.9)).toStringAsFixed(2)
              : (mass / (l * w * h)).toStringAsFixed(2)
        }
      ];
    }

    final output = checkCompute();

    expect(
      function([
        {"name": "mass", "type": "number", "value": 900},
        {"name": "length", "type": "number", "value": 6},
        {"name": "width", "type": "number", "value": 7},
        {"name": "height", "type": "number", "value": 8},
        {"name": "densityOption", "type": "string", "value": "specGravity"}
      ], [
        {"name": "volume", "expression": "length * width * height"},
        {
          "name": "density",
          "expression":
          "IIF(densityOption == 'specGravity', mass / (length * width * height * 0.9),	mass / (length * width * height) )"
        }
      ]),
      output,
    );
  });
}
