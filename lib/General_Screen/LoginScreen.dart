import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import 'NameContactScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.freshgreen,),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NameContactScreen(),
                ));
              },
              child: stylish_button(
                  txt_for_container: 'Road Evalutaion Form',
                  height: height * 0.1,
                  width: width)),
          // stylish_button(
          //     txt_for_container: ' sewerage Evaluation Form',
          //     height: height * 0.1,
          //     width: width)
        ],
      ),
    ));
  }
}
///hi i am khubaib 