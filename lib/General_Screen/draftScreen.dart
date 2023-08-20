import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mam_sana_afzal/utils/Appcolor.dart';

import 'DraftDocumentScreen.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({Key? key}) : super(key: key);

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {

  final snap = FirebaseFirestore.instance.collection('draft').orderBy('date',descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Draft'),centerTitle: true,backgroundColor: AppColors.freshgreen,),
       body: StreamBuilder(
         stream: snap,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.connectionState == ConnectionState.active) {
               return ListView.builder(
                 itemCount: snapshot.data!.docs.length,
                 itemBuilder: (context, index) {
                   String city = snapshot.data!.docs[index]['city'].toString();
                   String date = snapshot.data!.docs[index]['date'].toString();

                   return Padding(
                     padding:   EdgeInsets.all(8.0),
                     child: SizedBox(
                       height: height*0.2,
                       width: width*0.2,
                       child: InkWell(
                         onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder:(context) => DraftDocumentScreen(nameofCity: city),));
                         },
                         child: Card(
                             elevation: 20.0,
                             color: AppColors.freshgreen,
                             shape: Border(right: BorderSide(color: Colors.black38, width: width*0.05,style:BorderStyle.solid)),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 // Text(name.toString(),style: TextStyle(fontSize: 32,fontFamily: 'courgette',color:AppColors.lightcolor),),
                                 Padding(
                                   padding: EdgeInsets.all(10),
                                   child: Text(city,style: TextStyle(fontSize: 16,fontFamily: 'cairo',fontWeight: FontWeight.bold,color: Colors.white),),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.all(10),
                                   child: Text(date,style: TextStyle(fontSize: 12,fontFamily: 'cairo',fontWeight: FontWeight.bold,color: Colors.white),),
                                 ),



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
      ),
    );
  }
}
