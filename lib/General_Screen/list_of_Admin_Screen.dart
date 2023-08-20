import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class ListOfAdmin extends StatefulWidget {
  const ListOfAdmin({Key? key}) : super(key: key);

  @override
  State<ListOfAdmin> createState() => _ListOfAdminState();
}

class _ListOfAdminState extends State<ListOfAdmin> {
  final adminCollection = FirebaseFirestore.instance.collection('admin').snapshots();
  var db_admin = FirebaseFirestore.instance.collection('admin');
  //
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(title: Text('List of Admin'),centerTitle: true,backgroundColor: AppColors.freshgreen,),
      body: StreamBuilder(
        stream: adminCollection,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  //     String name = snapshot.data!.docs[index]['starting_date'].toString();
                  String name = snapshot.data!.docs[index]['name'].toString();
                  //     String quantity = snapshot.data!.docs[index]['isCompleted'].toString();
                  String email = snapshot.data!.docs[index]['email'].toString();
                  String id = snapshot.data!.docs[index]['id'].toString();

                  return Padding(
                    padding:EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height*0.2,
                      width: width*0.2,
                      child: InkWell(
                        onLongPress: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Are you Sure want to Delete!'),
                                actions: [
                                  ElevatedButton(
                                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(AppColors.freshgreen)),
                                      onPressed: () {
                                         db_admin.doc(id).delete();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Yes')),
                                  ElevatedButton(
                                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(AppColors.freshgreen)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('NO')),
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                       color: AppColors.freshgreen,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.blueAccent,
                  elevation: 15,
                  child: ClipPath(
                  clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height*0.05))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Text(name.toString(),style: TextStyle(fontSize: 32,fontFamily: 'courgette',color:AppColors.lightcolor),),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(name,style: TextStyle(fontSize: 16,color: AppColors.lightcolor)),
                                    ],),
                                ),

                                Text(email,style: TextStyle(fontSize: 16,color: AppColors.lightcolor)),
                              ],)),
                      ),
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
