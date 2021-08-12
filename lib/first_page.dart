import 'package:flutter/material.dart';
import 'package:sevenlakes/second_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _massController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _densityOptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showError() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(
          "Please Fill all the fields",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _massController.dispose();
    _heightController.dispose();
    _widthController.dispose();
    _lengthController.dispose();
    _densityOptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seven Lakes Assignment"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            inputTextField("Enter mass", _massController, false),
            inputTextField("Enter length", _lengthController, false),
            inputTextField("Enter width", _widthController, false),
            inputTextField("Enter height", _heightController, false),
            inputTextField(
                "Enter densityOption", _densityOptionController, true),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == false) {
                    // showError();
                    return;
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title: "Seven Lakes Assignment",
                          width: double.parse(_widthController.text),
                          length: double.parse(_lengthController.text),
                          height: double.parse(_heightController.text),
                          mass: double.parse(_massController.text),
                          densityOption: _densityOptionController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  inputTextField(hintText, controller, isStringInput) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isStringInput
            ? TextInputType.text
            : TextInputType.numberWithOptions(
                decimal: true,
              ),
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Field Cannot be empty";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
