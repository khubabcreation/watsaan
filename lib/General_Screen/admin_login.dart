import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/General_Screen/LoginScreen.dart';
import 'package:mam_sana_afzal/app_colors.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';
import 'package:mam_sana_afzal/utils/custom_Textform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Admin_LoginScreen extends StatefulWidget {
  const Admin_LoginScreen({Key? key}) : super(key: key);

  @override
  State<Admin_LoginScreen> createState() => _Admin_LoginScreenState();
}

class _Admin_LoginScreenState extends State<Admin_LoginScreen>
    with RestorationMixin {
  RestorableTextEditingController emailController =
      RestorableTextEditingController();
  RestorableTextEditingController passwordController =
      RestorableTextEditingController();
  final GlobalKey<FormState> keyy = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Home'),
          centerTitle: true,
          backgroundColor: AppColors.freshgreen,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: keyy,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.25,
                  ),
                  Text(
                    'Enter the Email Which is Provided by Super Admin',
                    style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: height * 0.015,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CustomTextFormField(
                      controller: emailController.value,
                      hintText: 'Email',
                      prefixIcon: Icons.email),
                  CustomTextFormField(
                      controller: passwordController.value,
                      hintText: 'Password',
                      prefixIcon: Icons.password),
                  InkWell(
                      onTap: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        if (keyy.currentState!.validate()) {
                          final dbInstance = await FirebaseFirestore.instance
                              .collection('admin')
                              .where('email',
                                  isEqualTo: emailController.value.text)
                              .where('password',
                                  isEqualTo: passwordController.value.text)
                              .get();
                          if (dbInstance.docs.isNotEmpty) {
                            pref.setBool('userlogin', true);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));

                            ///this is the admin home screen
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Check Email Password Again')));
                          }
                        }
                      },
                      child: stylish_button(
                          txt_for_container: 'Log in',
                          height: height * 0.08,
                          width: width * 0.8))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'Admin_home_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(emailController, 'email');
    registerForRestoration(passwordController, 'password');
  }
}
