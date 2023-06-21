import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({Key? key}) : super(key: key);

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Center(child: Lottie.asset('assets/congra.json'),),
            Center(
              child: Text('Congration Your Record Submitted'),
            ),
          ],
        ),
      ),
    );
  }
}
