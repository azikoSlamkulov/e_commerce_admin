import 'package:flutter/material.dart';

class CustomTextFormFieldTow extends StatelessWidget {
  const CustomTextFormFieldTow({
    required this.controller,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //minLines: 10,
      //maxLines: 10,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 5.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Поле не должно быть пустым!';
        }
        return null;
      },
      //onChanged: onChanged,
    );
  }
}
