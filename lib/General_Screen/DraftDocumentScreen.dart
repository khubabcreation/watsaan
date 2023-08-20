import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'draftFormScreen.dart';

class DraftDocumentScreen extends StatefulWidget {
    DraftDocumentScreen({Key? key,required this.nameofCity}) : super(key: key);
    String nameofCity='' ;

  @override
  State<DraftDocumentScreen> createState() => _DraftDocumentScreenState(city: nameofCity);
}

class _DraftDocumentScreenState extends State<DraftDocumentScreen> {
  _DraftDocumentScreenState({required this.city});
  String city ;

  @override
  Widget build(BuildContext context) {
    final snap = FirebaseFirestore.instance.collection('draft').where('city',isEqualTo:city).snapshots();
    double height = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.freshgreen,),
      backgroundColor: AppColors.freshgreen,
      body:StreamBuilder(
      stream: snap,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }else if(!snapshot.hasData){
            return Center(child: Text('There is No data !'),);
          }
          else if (snapshot.connectionState == ConnectionState.active) {

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                String district = snapshot.data!.docs[index]['district'].toString();
                String name = snapshot.data!.docs[index]['name'].toString();
                String city = snapshot.data!.docs[index]['city'].toString();
                return Padding(
                  padding:   EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: height*0.2,
                    width: width*0.2,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>DraftFormScreen(name: name, cityname: city,),));
                      },
                      child: Card(
                          elevation: 20.0,
                          color: AppColors.freshgreen,
                          shape: Border(right: BorderSide(color: Colors.black38,width: width*0.05,style:BorderStyle.solid)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Text(name.toString(),style: TextStyle(fontSize: 32,fontFamily: 'courgette',color:AppColors.lightcolor),),
                              Text('District : $district',style: TextStyle(fontSize: 16,color: AppColors.lightcolor,fontFamily: 'cairo')),
                              Text('Name : $name',style: TextStyle(fontSize: 16,color: AppColors.lightcolor,fontFamily: 'cairo'),),


                            ],)),
                    ),
                  ),
                );
              },
            );
          }
          return Text('Some thing went Wrong');
        }
        return Center(child: CircularProgressIndicator());
      },
    ) ,);
  }
}
