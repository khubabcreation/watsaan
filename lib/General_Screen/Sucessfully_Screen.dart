import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mam_sana_afzal/General_Screen/NameContactScreen.dart';

import '../RoadFrom/RoadDetailsScreen.dart';
import '../app_colors.dart';

class SucessfullyScreen extends StatefulWidget {
    SucessfullyScreen({Key? key}) : super(key: key);

  @override
  State<SucessfullyScreen> createState() => _SucessfullyScreenState();
}

class _SucessfullyScreenState extends State<SucessfullyScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.freshgreen,),
        body: Column(
          children: [
            SizedBox(height: height*0.04,),
            Center(child: Lottie.asset('assets/submitted.json'),),
            SizedBox(height: height*0.02,),

            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async{
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => NameContactScreen(),));
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: AppColors.freshgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child:   Center(
                      child: Text(
                        'Home Screen',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
