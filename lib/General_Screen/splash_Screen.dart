import 'package:flutter/material.dart';

import 'Select_Role_Screen.dart';

class SplashScreen extends StatefulWidget {
  static const String pageName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectRoleScreen(),));
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration:   BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/watsaan.png'), fit: BoxFit.contain),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 175),
                    child: Text('WATSAN',
                    style: TextStyle(fontWeight:FontWeight.bold),
                  ),
                ),
                )

              ],
            ),
          )),
    );
  }
}