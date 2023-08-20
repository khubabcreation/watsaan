import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/password_field_bloc/password_field_bloc.dart';


class CustomPasswordTextField extends StatelessWidget {
  CustomPasswordTextField({
    Key? key,
    this.validator,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);
  String? Function(String?)? validator;
  TextEditingController controller;
  TextInputType? textInputType;
  String hintText;
  Icon prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var passwordBloc = Provider.of<PasswordFieldBloc>(context, listen: false);
    return SizedBox(
      height: height * 0.12,
      width: width * 0.8,
      child: BlocBuilder<PasswordFieldBloc, PasswordFieldState>(
        builder: (context, state) {
          if (state is PasswordVisibleState) {
            return TextFormField(
              cursorColor: Colors.blue,
              validator: validator,
              controller: controller,
              keyboardType: textInputType,
              obscureText: state.isObscureText,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  prefixIconColor: Colors.blue,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (state.isObscureText) {
                        passwordBloc
                            .add(VisiblePasswordEvent(obscureText: false));
                      } else {
                        passwordBloc
                            .add(VisiblePasswordEvent(obscureText: true));
                      }
                    },
                    icon: state.isObscureText
                        ? Icon(
                      Icons.visibility_off,
                      color:Colors.blue,
                    )
                        : Icon(
                      Icons.visibility,
                      color: Colors.blue,
                    ),
                  ),
                  helperText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:Colors.blue),
                  ),
                  errorStyle: TextStyle(color: Colors.white)),
            );
          } else {
            return TextFormField(
              cursorColor: Colors.blue,
              validator: validator,
              controller: controller,
              keyboardType: textInputType,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  prefixIconColor: Colors.blue,
                  suffixIcon: IconButton(
                      onPressed: () {
                        passwordBloc
                            .add(VisiblePasswordEvent(obscureText: false));
                      },
                      icon: Icon(
                        Icons.visibility_off,
                        color: Colors.blue,
                      )),
                  helperText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorStyle: TextStyle(color: Colors.white)),
            );
          }
        },
      ),
    );
  }
}
