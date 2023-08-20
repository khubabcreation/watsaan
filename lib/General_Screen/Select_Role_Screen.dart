import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/General_Screen/NameContactScreen.dart';
import 'package:mam_sana_afzal/General_Screen/SuperAdminHomeScreen.dart';
import 'package:mam_sana_afzal/General_Screen/superAdminloginepage.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Custome_Widget/check_Connectivity.dart';
import '../animation/animation_txt.dart';
import 'admin_login.dart';

class SelectRoleScreen extends StatelessWidget {
  SelectRoleScreen({Key? key}) : super(key: key);
  static const String pageName = '/selectRoleScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CheckConnectivity(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: height,
                    width: width,
                    color: AppColors.darkblue,
                  ),
                ),
                Center(
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        color: AppColors.freshgreen,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.035),
                    duration:   Duration(milliseconds: 200),
                    child: AnimatedTextKitT(animatedTexts: [
                      WavyAnimatedTextT("Select Your Role First",
                          speed: Duration(milliseconds: 200)),
                    ], isRepeatingAnimation: true, repeatForever: true),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.2),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async{
                        SharedPreferences pref =await SharedPreferences.getInstance();
                     bool? checkstatus = pref.getBool('superadminlogin');
                     if(checkstatus == true){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperAdminHomeScreen(),));
                     }else {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperAdminLoginScreen(),));
                     }

                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                            color: AppColors.freshgreen,
                            borderRadius: BorderRadius.circular(10)),
                        child:   Center(
                          child: Text(
                            'Admin',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.4),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async{
                        SharedPreferences pref = await SharedPreferences.getInstance();
                      bool? checkstatus =   pref.getBool('userlogin');
                      if(checkstatus == true){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NameContactScreen(),));
                      }else{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin_LoginScreen(),));
                      }

                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                            color: AppColors.freshgreen,
                            borderRadius: BorderRadius.circular(10)),
                        child:   Center(
                          child: Text(
                            'User',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height * 0.6),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async{
                     //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin_LoginScreen(),));
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                            color: AppColors.freshgreen,
                            borderRadius: BorderRadius.circular(10)),
                        child:   Center(
                          child: Text(
                            'Request Admin to Register',
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
            )),
      ),
    );
  }
}
class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 4.25);
    var firstControlPoint = Offset(size.width / 4, size.height / 3);
    var firstEndPoint = Offset(size.width / 2, size.height / 3 - 60);
    var secondControlPoint =
    Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
