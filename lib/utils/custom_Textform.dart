

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
        required this.controller,
        this.validatorFunction,
        required this.hintText,
        required this.prefixIcon,
        this.suffixIcon,
        this.listOfFormatter,
        this.textInputType,
        this.textlenght,
        this.onChanged})
      : super(key: key);
  TextEditingController controller;
  String? Function(String? value)? validatorFunction;
  IconData prefixIcon;
  IconData? suffixIcon;
  String hintText;
  int? textlenght ;
  Function(String)? onChanged;
  List<TextInputFormatter>? listOfFormatter;
  TextInputType? textInputType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.10,
      width: width * 0.8,
      child: TextFormField(
        maxLength: textlenght,
        onChanged: onChanged,
        keyboardType: textInputType,
        inputFormatters: listOfFormatter,
        cursorColor:Colors.green,
        validator: validatorFunction,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.green,
            ),
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.blueAccent,
            ),
            hintText: hintText,
            helperText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:Colors.blue),
            ),
            errorStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
