import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mam_sana_afzal/app_colors.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';
import 'package:mam_sana_afzal/utils/custom_Textform.dart';

class addAminScreen extends StatefulWidget {
  const addAminScreen({Key? key}) : super(key: key);

  @override
  State<addAminScreen> createState() => _addAminScreenState();
}

class _addAminScreenState extends State<addAminScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final admin_collection = FirebaseFirestore.instance.collection('admin');

    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Admin'),
          centerTitle: true,
          backgroundColor: AppColors.freshgreen,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Admin',
                  style: TextStyle(
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold,
                      color: AppColors.freshgreen,
                      fontSize: height * 0.04)),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFormField(
                  controller: namecontroller,
                  hintText: 'Enter Name',
                  prefixIcon: Icons.person),
              CustomTextFormField(
                  validatorFunction:
                      EmailValidator(errorText: 'Invalid Email Adress'),
                  controller: emailcontroller,
                  hintText: 'Enter Email',
                  prefixIcon: Icons.person),
              CustomTextFormField(
                  controller: passwordcontroller,
                  hintText: 'Enter Password',
                  prefixIcon: Icons.lock),
              InkWell(
                  onTap: () async {
                    String id = admin_collection.doc().id;
                    final refCheck = await admin_collection
                        .where('email', isEqualTo: emailcontroller.text.trim())
                        .get();
                    if (refCheck.docs.isEmpty) {
                      admin_collection.doc(id).set({
                        'id': id,
                        'name': namecontroller.text.trim().toString(),
                        'email': emailcontroller.text.trim().toString(),
                        'password': passwordcontroller.text.trim().toString(),
                      }).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Admin has been Added Sucessfully')));
                        FocusManager.instance.primaryFocus!.unfocus();
                        Navigator.of(context).pop();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('This Email is Already Exis')));
                    }
                  },
                  child: stylish_button(
                      txt_for_container: 'Add Admin',
                      height: height * 0.08,
                      width: width * 0.8))
            ],
          ),
        ),
      ),
    );
  }
}
