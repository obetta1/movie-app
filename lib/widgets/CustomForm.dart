// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:movi_app/utils/validation.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key,   required this.validator, required this.formKey, required this.controller});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }

  final TextEditingController controller;
  // final String label;
  // final IconData? icon;
 final FormFieldValidator validator;
final GlobalKey<FormState> formKey;
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  // final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key:widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            // The validator receives the text that the user has entered.
            validator: widget.validator

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (widget.formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}