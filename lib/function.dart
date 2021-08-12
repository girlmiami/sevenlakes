import 'package:function_tree/function_tree.dart';
import 'package:expressions/expressions.dart';

List function(input1, inputToCompute) {
  // list to be returned
  var computedList = [];

  try {
    // loop through compute attributes
    inputToCompute.forEach((element) {
      var computedMap = {};
      computedMap["name"] = element["name"];
      if (element["name"] == "volume") {
        final volume = "${element["expression"]}"
            .toMultiVariableFunction(['length', 'width', 'height']);
        final sb = StringBuffer();

        // get l b h
        var l;
        var b;
        var h;
        input1.forEach((element) {
          if (element["name"] == "length") {
            if (element["type"] == "number") {
              l = element["value"];
            } else {}
          } else if (element["name"] == "width") {
            b = element["value"];
          } else if (element["name"] == "height") {
            h = element["value"];
          }
        });

        // sb
        //   ..write(volume({
        //     'length': l,
        //     'width': b,
        //     'height': h,
        //   }));
        computedMap["value"] = volume({
          'length': l,
          'width': b,
          'height': h,
        });
      } else {
        var allExpString = element["expression"]
            .substring(4, element["expression"].length - 2);
        var listOfExp = allExpString.split(",");

        // Parse expression:
        Expression logicalExpression = Expression.parse("${listOfExp[0]}");

        // expression1 for ternary when true
        final expression1 = "${listOfExp[1]}".toMultiVariableFunction([
          'length',
          'width',
          'height',
          'mass',
        ]);
        // expression1 for ternary when false
        final expression2 = "${listOfExp[2]}".toMultiVariableFunction([
          'length',
          'width',
          'height',
          'mass',
        ]);
        // final sb1 = StringBuffer();
        // final sb2 = StringBuffer();

        // get l b h
        var l;
        var b;
        var h;
        var mass;
        var densityOption;
        input1.forEach((element) {
          if (element["name"] == "length") {
            l = element["value"];
          } else if (element["name"] == "width") {
            b = element["value"];
          } else if (element["name"] == "height") {
            h = element["value"];
          } else if (element["name"] == "mass") {
            mass = element["value"];
          } else if (element["name"] == "densityOption") {
            densityOption = element["value"];
          }
        });

        // Create context containing all the variables and functions used in the expression
        var context = {"densityOption": densityOption};
        // Evaluate expression
        final evaluator = const ExpressionEvaluator();
        var r = evaluator.eval(logicalExpression, context);

        print(r);
        // sb1
        //   ..write(expression1({
        //     'length': l,
        //     'width': b,
        //     'height': h,
        //     'mass': mass,
        //   }).toStringAsFixed(2));
        // sb2
        //   ..write(expression2({
        //     'length': l,
        //     'width': b,
        //     'height': h,
        //     'mass': mass,
        //   }).toStringAsFixed(2));
        computedMap["value"] = r
            ? expression1({
                'length': l,
                'width': b,
                'height': h,
                'mass': mass,
              }).toStringAsFixed(2)
            : expression2({
                'length': l,
                'width': b,
                'height': h,
                'mass': mass,
              }).toStringAsFixed(2);
      }

      computedList.add(computedMap);
    });
    return computedList;
  } catch (error, stackTrace) {
    print(error);
    print(stackTrace);
    return computedList;
  }
}
