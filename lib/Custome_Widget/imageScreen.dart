import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final snapshot = FirebaseFirestore.instance.collection('images').snapshots();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:StreamBuilder(
        stream: snapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.active) {

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                    String imageUrl = snapshot.data!.docs[index]['image_url'].toString();
                    String latitude = snapshot.data!.docs[index]['latitude'].toString();
                  String longitude = snapshot.data!.docs[index]['longitude'].toString();
                  String roadName = snapshot.data!.docs[index]['roadName'].toString();

                  return Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height*0.5,
                      width: width*0.2,
                      child: InkWell(
                        child: Card(
                            elevation: 14.0,
                            color: AppColors.freshgreen,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: height*0.3,
                                width: width,
                                  child:FittedBox(child: Image.network(imageUrl)),
                                ),
                                  Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('longitude : $longitude',style: TextStyle(fontSize: 16,color: AppColors.lightcolor)),
                                      Text('latitude : $latitude',style: TextStyle(fontSize: 16,color: AppColors.lightcolor),),
                                    ],),
                                ),
                                FittedBox(child: Text('Road Name : $roadName',style: TextStyle(fontSize: 16,color: AppColors.lightcolor))),
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
      ),
    );
  }
}
