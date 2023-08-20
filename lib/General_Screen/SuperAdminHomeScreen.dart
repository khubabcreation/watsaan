import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mam_sana_afzal/General_Screen/list_of_Admin_Screen.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';

import 'Add_AdminScreen.dart';

class SuperAdminHomeScreen extends StatefulWidget {
  const SuperAdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<SuperAdminHomeScreen> createState() => _SuperAdminHomeScreenState();
}

class _SuperAdminHomeScreenState extends State<SuperAdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to you as a  Super Admin',style: TextStyle(color: AppColors.freshgreen,fontWeight: FontWeight.bold,fontFamily: 'cairo'),),
              SizedBox(
                height: height * 0.1,
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => addAminScreen(),
                  ));
                },
                child: Center(
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.freshgreen,
                        borderRadius:
                            BorderRadius.all(Radius.circular(height * 0.05))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: height * 0.14,
                            width: width * 0.6,
                            child: Lottie.asset('assets/add_admin_super.json')),
                        Text(
                          'Add Admin',
                          style: TextStyle(
                              fontFamily: 'cairo',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.05,
              ),

              ///monitor records
              InkWell(
                onTap: () {},
                child: Center(
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.freshgreen,
                        borderRadius:
                            BorderRadius.all(Radius.circular(height * 0.05))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: height * 0.14,
                            width: width * 0.6,
                            child: Lottie.asset('assets/vandor.json')),
                        Text(
                          'Monitor Records',
                          style: TextStyle(
                              fontFamily: 'cairo',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /// here is the list of the admins
            SizedBox(height: height*0.05,),


              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListOfAdmin(),));
                },
                child: Center(
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.freshgreen,
                        borderRadius:
                        BorderRadius.all(Radius.circular(height * 0.05))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: height * 0.14,
                            width: width * 0.6,
                            child: Lottie.asset('assets/three.json')),
                        Text(
                          'List of Admins',
                          style: TextStyle(
                              fontFamily: 'cairo',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

    );
  }
}
