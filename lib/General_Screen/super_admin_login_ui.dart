import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:provider/provider.dart';

import '../Custome_Widget/custome_password_textfiled.dart';
import '../Custome_Widget/textformfield_validations.dart';
import '../bloc/signin_bloc/sign_in_bloc.dart';
import '../utils/custom_Textform.dart';


class SuperAdminLoginUI extends StatelessWidget with TextFormFieldValidationMixin{
  SuperAdminLoginUI({Key? key}) : super(key: key);
  final TextEditingController emailTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //Row SizedBox
            SizedBox(
              height: height * 0.06,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.05),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color:Colors.blue,
                        ),
                      ))),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            //pic
            SizedBox(
              height: height * 0.3,
              child: Image.asset('assets/watsaan.png'),
            ),
            //text
            SizedBox(
              height: height * 0.1,
              child: Center(
                child: Text(
                  'Login Here',
                  style: TextStyle(
                      color:Colors.blue, fontSize: height * 0.05),
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            //form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      validatorFunction:RequiredValidator(errorText: 'Invalid Email') ,
                      controller: emailTextEditingController,
                      hintText: 'Email',
                      prefixIcon: Icons.email),
                  CustomPasswordTextField(
                    controller: passwordTextEditingController,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    hintText: 'Password',
                    textInputType: TextInputType.text,
                    validator: RequiredValidator(errorText: 'Incorrect Email'),
                  ),
                ],
              ),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  signInBloc.add(SignInSuccessfullyEvent(
                      email: emailTextEditingController.text,
                      password: passwordTextEditingController.text));
                }
              },
              child: Container(
                height: height * 0.07,
                width: width * 0.8,
                child: Center(
                  child: Text(
                    'SignIn',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
