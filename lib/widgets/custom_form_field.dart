import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'responsive_ui.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  CustomTextFormField(
      {Key key,
      this.hint,
      this.textEditingController,
      this.keyboardType,
      this.obscureText = false,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: large ? 12 : (medium ? 10 : 8),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: keyboardType,
          validator: (value) {
            if (value.isEmpty || value == null) {
              return "Please enter some text";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
