import 'package:flutter/material.dart';
import 'cut_corners_border.dart';

Widget buildtextfield(String label, bool ispassword) {
  return TextField(
    style: TextStyle(fontSize: 21),
    decoration: InputDecoration(border: CutCornersBorder(), labelText: label),
  );
}

Widget builddropdown() {
  return FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
            //   labelStyle: textStyle,
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: 'Please select expense',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                state.didChange(newValue);
              });
            },
            items: _currencies.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
  );
}

void setState(Null Function() param0) {}

var _currencies = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
  "Salary"
];
