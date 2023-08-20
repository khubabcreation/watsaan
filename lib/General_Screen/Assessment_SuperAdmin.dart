import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class AssessmentSuperAdmin extends StatefulWidget {
  const AssessmentSuperAdmin({Key? key}) : super(key: key);

  @override
  State<AssessmentSuperAdmin> createState() => _AssessmentSuperAdminState();
}

class _AssessmentSuperAdminState extends State<AssessmentSuperAdmin> {
   final snap = FirebaseFirestore.instance.collection('assessment').snapshots();
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body:StreamBuilder(
          stream: snap,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String comments = snapshot.data!.docs[index]['comments'].toString();
                    String currentLocation = snapshot.data!.docs[index]['currentLocation'].toString();
                    String latitude = snapshot.data!.docs[index]['latitude'].toString();
                    String longitude = snapshot.data!.docs[index]['longitude'].toString();
                    String no_of_lane = snapshot.data!.docs[index]['no_of_lane'].toString();
                    String no_of_width = snapshot.data!.docs[index]['no_of_width'].toString();
                    String remarks = snapshot.data!.docs[index]['remarks'].toString();
                    String roadCondition = snapshot.data!.docs[index]['roadCondition'].toString();
                    String roadConditionAssesment = snapshot.data!.docs[index]['roadConditionAssesment'].toString();
                    String total_road_width = snapshot.data!.docs[index]['total_road_width'].toString();
                    String typeOfCarriage = snapshot.data!.docs[index]['typeOfCarriage'].toString();
                    String road_Name = snapshot.data!.docs[index]['road_Name'].toString();


                    return SizedBox(
                      height: height*0.6,
                      width: width*0.2,
                      child: InkWell(
                        child: Card(
                            elevation: 14.0,
                            color: AppColors.freshgreen,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 FittedBox(child: Text('Road Name : $road_Name',style: TextStyle(fontSize: height*0.02,fontFamily: 'cairo',color:AppColors.lightcolor,fontWeight: FontWeight.bold),)),
                                 FittedBox(child: Text('Location : $currentLocation',style: TextStyle(fontSize: height*0.02,fontFamily: 'cairo',color:AppColors.lightcolor,fontWeight: FontWeight.bold),)),
                                FittedBox(child: Text('longitude : $longitude',style: TextStyle(fontSize: 16,color: AppColors.lightcolor))),
                                FittedBox(child: Text('latitude : $latitude',style: TextStyle(fontSize: 16,color: AppColors.lightcolor),)),
                                FittedBox(child: Text('Road Condition: $roadConditionAssesment',style: TextStyle(fontSize: 16,color: AppColors.lightcolor))),
                                FittedBox(child: Text('roadCondition : $roadCondition',style: TextStyle(fontSize: 16,color: AppColors.lightcolor),)),
                                FittedBox(child: Text('No of Lane : $no_of_lane',style: TextStyle(fontSize: 16,color: AppColors.lightcolor))),
                                FittedBox(child: Text('Width : $no_of_width',style: TextStyle(fontSize: 16,color: AppColors.lightcolor),)),
                                FittedBox(child: Text('Remarks : $remarks',style: TextStyle(fontSize: height*0.02,fontFamily: 'cairo',color:AppColors.lightcolor),)),
                                FittedBox(child: Text('Comments : $comments',style: TextStyle(fontSize: height*0.02,fontFamily: 'cairo',color:AppColors.lightcolor),)),

                              ],)),
                      ),
                    );
                  },
                );
              }
              return Text('Some thing went Wrong');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
