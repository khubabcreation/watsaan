import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/General_Screen/NameContactScreen.dart';
import 'package:mam_sana_afzal/RoadFrom/RoadDetailsScreen.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../Custome_Widget/DropDownButton.dart';
import '../app_colors.dart';
import 'Sucessfully_Screen.dart';

class DraftFormScreen extends StatefulWidget {
  DraftFormScreen({Key? key, required this.name, required this.cityname})
      : super(key: key);
  String name;

  String cityname;

  @override
  State<DraftFormScreen> createState() => _DraftFormScreenState();
}

class _DraftFormScreenState extends State<DraftFormScreen> {

 // final snapshot = FirebaseFirestore.instance.collection('draft').snapshots();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController districController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController typeofRoadController = TextEditingController();
  TextEditingController numberoflaneController = TextEditingController();
  TextEditingController widthofLaneController = TextEditingController();
  TextEditingController totalroadWidthContrller = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController remarksControlller = TextEditingController();
  TextEditingController signalNumberController = TextEditingController();
  TextEditingController signalCommentController = TextEditingController();
  TextEditingController roundNumberController = TextEditingController();
  TextEditingController roundCommentController = TextEditingController();
  TextEditingController roadsideNumberController = TextEditingController();
  TextEditingController roadsideCommentsController = TextEditingController();
  TextEditingController signNumberController = TextEditingController();
  TextEditingController signCommentsController = TextEditingController();
  TextEditingController kerbNumberController = TextEditingController();
  TextEditingController kerbCommentsController = TextEditingController();
  TextEditingController catEyesNumberController = TextEditingController();
  TextEditingController catEyesCommentsController = TextEditingController();
  TextEditingController dividerNumberController = TextEditingController();
  TextEditingController dividerCommentsController = TextEditingController();
  TextEditingController markationNumberController = TextEditingController();
  TextEditingController markationCommentsController = TextEditingController();
  TextEditingController roadshoulderNumController = TextEditingController();
  TextEditingController roadShoulderCommentsController = TextEditingController();
  TextEditingController shadeNumberController = TextEditingController();
  TextEditingController shadeCommentsController = TextEditingController();
  TextEditingController benchnumberController = TextEditingController();
  TextEditingController benchCommentsController = TextEditingController();
  TextEditingController encromentNumberController = TextEditingController();
  TextEditingController encromentCommentsController = TextEditingController();
  TextEditingController greenNumberController = TextEditingController();
  TextEditingController greenCommentsController = TextEditingController();
  TextEditingController footNumberController = TextEditingController();
  TextEditingController footCommentsController = TextEditingController();
  TextEditingController streetNumberController = TextEditingController();
  TextEditingController streetCommentsController = TextEditingController();
  TextEditingController lastCommentsController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();
  final keyy =  GlobalKey<FormState>();
    bool enabletextfrom = false;
    bool ischeck = false ;
late Stream<QuerySnapshot<Map<String, dynamic>>>   snapshot ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assighndata();
  }
  assighndata(){
     snapshot = FirebaseFirestore.instance
        .collection('draft')
        .where('name', isEqualTo: widget.name)
        .where('city', isEqualTo: widget.cityname)
        .snapshots();
  }
late  double height ;
late  double width ;


  @override
  Widget build(BuildContext context) {
    print('thanks i am build ');
    height = MediaQuery.of(context).size.height - kToolbarHeight;
     width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: snapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.data == null){
              return Center(child: Text('There is no Record ! Sorry '),);
            }
            else if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]['name'].toString();
                  String phone = snapshot.data!.docs[index]['phone'].toString();
                  String city = snapshot.data!.docs[index]['city'].toString();
                   String district = snapshot.data!.docs[index]['district'].toString();
                  String concernedDepartment = snapshot
                      .data!.docs[index]['concernedDepartment']
                      .toString();
                  String typeOfCarriage =
                      snapshot.data!.docs[index]['typeOfCarriage'].toString();
                  String road_Name =
                      snapshot.data!.docs[index]['road_Name'].toString();
                  String typeOfRoad =
                      snapshot.data!.docs[index]['typeOfRoad'].toString();
                  String no_of_lane =
                      snapshot.data!.docs[index]['no_of_lane'].toString();
                  String no_of_width =
                      snapshot.data!.docs[index]['no_of_width'].toString();
                  String total_road_width =
                      snapshot.data!.docs[index]['total_road_width'].toString();

                  String signalAvailabilty =
                  snapshot.data!.docs[index]['singal_availability'].toString();
                  String signalCondition =
                  snapshot.data!.docs[index]['singal_condition'].toString();
                  String roundAvailabilty =
                  snapshot.data!.docs[index]['roundAbout_availability'].toString();
                  String roundCondition =
                  snapshot.data!.docs[index]['roundAbout_condition'].toString();

                  String roadSideAvailability =
                  snapshot.data!.docs[index]['roadSide_availability'].toString();
                  String roadSideCondition =
                  snapshot.data!.docs[index]['roadSide_condition'].toString();

                  String signbordAvailabilty =
                  snapshot.data!.docs[index]['signBoard_availability'].toString();
                  String signboardCondition =
                  snapshot.data!.docs[index]['signBoard_condition'].toString();
                  String kerbAvailability =
                  snapshot.data!.docs[index]['kerb_availability'].toString();
                  String kerbCondition =
                  snapshot.data!.docs[index]['kerb_condition'].toString();
                  String catEyeAvailability =
                  snapshot.data!.docs[index]['catEyes_availability'].toString();
                  String catEyeConditon =
                  snapshot.data!.docs[index]['catEyes_condition'].toString();

                  String dividerAvailability =
                  snapshot.data!.docs[index]['divider_availability'].toString();

                  String dividerCondition =
                  snapshot.data!.docs[index]['divider_condition'].toString();

                  String marktionAvailibility =
                  snapshot.data!.docs[index]['markation_availability'].toString();

                  String marktionCondition =
                  snapshot.data!.docs[index]['markation_condition'].toString();

                  String roadShoulderAvailibility =
                  snapshot.data!.docs[index]['roadShoulder_availability'].toString();
                  String roadShoulderCondition =
                  snapshot.data!.docs[index]['roadShoulder_condition'].toString();
                  String shadeAvailibility =
                  snapshot.data!.docs[index]['roadSideBusShader_availability'].toString();
                  String shadeCondition =
                  snapshot.data!.docs[index]['roadSideBusShader_condition'].toString();
                  String benchAvailibility =
                  snapshot.data!.docs[index]['roadSideBusbench_availability'].toString();
                  String benchCondition =
                  snapshot.data!.docs[index]['roadSideBusbench_condition'].toString();
                  String encromentAvailibility =
                  snapshot.data!.docs[index]['encroachment_availability'].toString();
                  String encromentCondition =
                  snapshot.data!.docs[index]['encroachment_condition'].toString();
                  String greebAvailibility =
                  snapshot.data!.docs[index]['greenbelt_availability'].toString();
                  String greenCondition =
                  snapshot.data!.docs[index]['greenbelt_condition'].toString();
                  String footpathAvailibility =
                  snapshot.data!.docs[index]['footpath_availability'].toString();
                  String footpathCondition =
                  snapshot.data!.docs[index]['footpath_condition'].toString();
                  String streetlightAvailibility =
                  snapshot.data!.docs[index]['streetlight_availability'].toString();
                  String streetlightCondition =
                  snapshot.data!.docs[index]['streetlight_condition'].toString();
                  String furnitureCondition =
                  snapshot.data!.docs[index]['furnitureCondition'].toString();


                  ///..................................................
                  String singal_number = snapshot
                      .data!.docs[index]['singal_number']
                      .toString();
                  String singal_comments = snapshot
                      .data!.docs[index]['singal_comments']
                      .toString();
                  String roundAbout_number = snapshot
                      .data!.docs[index]['roundAbout_number']
                      .toString();
                  String roundAbout_comments = snapshot
                      .data!.docs[index]['roundAbout_comments']
                      .toString();
                  String roadSide_number = snapshot
                      .data!.docs[index]['roadSide_number']
                      .toString();
                  String roadSide_comments = snapshot
                      .data!.docs[index]['roadSide_comments']
                      .toString();
                  String signBoard_number = snapshot
                      .data!.docs[index]['signBoard_number']
                      .toString();
                  String signBoard_comments = snapshot
                      .data!.docs[index]['signBoard_comments']
                      .toString();
                  String kerb_number = snapshot
                      .data!.docs[index]['kerb_number']
                      .toString();
                  String kerb_comments = snapshot
                      .data!.docs[index]['kerb_comments']
                      .toString();
                  String catEyes_number = snapshot
                      .data!.docs[index]['catEyes_number']
                      .toString();
                  String catEyes_comments = snapshot
                      .data!.docs[index]['catEyes_comments']
                      .toString();
                  String divider_number = snapshot
                      .data!.docs[index]['divider_number']
                      .toString();
                  String divider_comments = snapshot
                      .data!.docs[index]['divider_comments']
                      .toString();
                  String markation_number = snapshot
                      .data!.docs[index]['markation_number']
                      .toString();
                  String markation_comments = snapshot
                      .data!.docs[index]['markation_comments']
                      .toString();
                  String roadShoulder_number = snapshot
                      .data!.docs[index]['roadShoulder_number']
                      .toString();
                  String roadShoulder_comments = snapshot
                      .data!.docs[index]['roadShoulder_comments']
                      .toString();
                  String roadSideBusShader_number = snapshot
                      .data!.docs[index]['roadSideBusShader_number']
                      .toString();
                  String roadSideBusShader_comments = snapshot
                      .data!.docs[index]['roadSideBusShader_comments']
                      .toString();
                  String roadSideBusbench_number = snapshot
                      .data!.docs[index]['roadSideBusbench_number']
                      .toString();
                  String roadSideBusbench_comments = snapshot
                      .data!.docs[index]['roadSideBusbench_comments']
                      .toString();
                  String encroachment_number = snapshot
                      .data!.docs[index]['encroachment_number']
                      .toString();
                  String encroachment_comments = snapshot
                      .data!.docs[index]['encroachment_comments']
                      .toString();
                  String greenbelt_number = snapshot
                      .data!.docs[index]['greenbelt_number']
                      .toString();
                  String greenbelt_comments = snapshot
                      .data!.docs[index]['greenbelt_comments']
                      .toString();
                  String footpath_number = snapshot
                      .data!.docs[index]['footpath_number']
                      .toString();
                  String footpath_comments = snapshot
                      .data!.docs[index]['footpath_comments']
                      .toString();
                  String streetlight_number = snapshot
                      .data!.docs[index]['streetlight_number']
                      .toString();
                  String streetlight_comments = snapshot
                      .data!.docs[index]['streetlight_comments']
                      .toString();
                  String lastComments = snapshot
                      .data!.docs[index]['lastComments']
                      .toString();


                  String id = snapshot
                      .data!.docs[index]['id']
                      .toString();

                  ///  streetlight_number
                  nameController.text             = name;
                  phoneController.text            = phone;
                  districController.text          = district;
                  cityController.text             = city;
                  numberoflaneController.text     = no_of_lane;
                  widthofLaneController.text      = no_of_width;
                  totalroadWidthContrller.text    = total_road_width;
                  // signalNumberController.text      = singal_number;
                  // signalCommentController.text    = singal_comments;
                  // roundNumberController.text       = roundAbout_number;
                  // roundCommentController.text     = roundAbout_comments;
                  // roadsideNumberController.text    = roadSide_number;
                  // roadsideCommentsController.text  = roadSide_comments;
                  // signNumberController.text = signBoard_number;
                  // signCommentsController.text = signBoard_comments;
                  // kerbNumberController.text = kerb_number;
                  // kerbCommentsController.text = kerb_comments;
                  // catEyesNumberController.text = catEyes_number;
                  // catEyesCommentsController.text = catEyes_comments;
                  // dividerNumberController.text = divider_number;
                  // dividerCommentsController.text = divider_comments;
                  // markationNumberController.text = markation_number;
                  // markationCommentsController.text = markation_comments;
                  // roadsideNumberController.text = roadShoulder_number;
                  // roadShoulderCommentsController.text = roadShoulder_comments;
                  // shadeNumberController.text = roadSideBusShader_number;
                  // shadeCommentsController.text = roadSideBusShader_comments;
                  // benchnumberController.text =roadSideBusbench_number ;
                  // benchCommentsController.text = roadSideBusbench_comments;
                  // encromentNumberController.text = encroachment_number;
                  // encromentCommentsController.text = encroachment_comments;
                  // greenNumberController.text = greenbelt_number;
                  // greenCommentsController.text = greenbelt_comments;
                  // footNumberController.text = footpath_number;
                  // footCommentsController.text = footpath_comments;
                  // streetNumberController.text = streetlight_number;
                  // streetCommentsController.text = streetlight_comments;
                  lastCommentsController.text = lastComments;
                  // roadNameController.text = road_Name ;
                  return Card(
                      elevation: 14.0,

                      child: Form(
                        key: keyy,
                        child: Padding(
                          padding:   EdgeInsets.symmetric(horizontal: width*0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            SizedBox(height: height*0.02,),
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),
                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                    labelText: 'Phone',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller: districController,
                                decoration: InputDecoration(
                                    labelText: 'District',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller:cityController ,
                                decoration: InputDecoration(
                                    labelText: 'City',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller:roadNameController ,
                                decoration: InputDecoration(
                                    labelText: 'Road Name',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller:numberoflaneController ,
                                decoration: InputDecoration(
                                    labelText: 'No of Lane',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(

                                controller:widthofLaneController ,
                                decoration: InputDecoration(
                                    labelText: 'Width of Lane',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              TextFormField(
                                controller:totalroadWidthContrller ,
                                decoration: InputDecoration(
                                    labelText: 'Total Road Width',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.01))),

                              ),
                              SizedBox(height: height*0.02,),
                              Text('Concerned Department/Agency'),
                              SizedBox(height: height*0.01,),
                              MyDropdownButton(
                                  height: height * 0.04,
                                  widht: width / 2,
                                  hint_txt: concernedDepartment,
                                  dropdownOptions: [
                                    'LG',
                                    'NHA',
                                    'C&W',
                                  ],
                                  ontap: (value) {
                                    if (value != null) {
                                    concernedDepartment = value.toString();
                                    }
                                  }),
                              SizedBox(height: height*0.02,),
                              Text('Type of Carriageway'),
                              SizedBox(height: height*0.01,),
                              MyDropdownButton(

                                  height: height * 0.04,
                                  widht: width / 2,
                                  hint_txt:typeOfCarriage,
                                  dropdownOptions: [
                                    'Single Carriageway','Dual Carriageway'
                                  ],
                                  ontap: (value) {
                                    if (value != null) {
                                     typeOfCarriage = value.toString();
                                    }
                                  }),
                              SizedBox(height: height*0.02,),
                              Text('Type of Road'),
                              SizedBox(height: height*0.01,),
                              MyDropdownButton(
                                  height: height * 0.04,
                                  widht: width / 2,
                                  hint_txt:typeOfRoad,
                                  dropdownOptions: [
                                    'Primary','Secondary','Tertiary','other'
                                  ],
                                  ontap: (value) {
                                    if (value != null) {
                                     typeOfRoad = value.toString();
                                    }
                                  }),
                              SizedBox(height: height*0.02,),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Signals',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.1,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt:signalAvailabilty ,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {

                                          if (value != null) {
                                          signalAvailabilty=value.toString();
                                          enabletextfrom = (value == 'Yes') ;
                                          }
                                        }),
                                    MyDropdownButton(
                                      height: height * 0.04,
                                      widht: width * 0.35,
                                      hint_txt: signalCondition,
                                      dropdownOptions: [
                                        'A',
                                        'B',
                                        'C',
                                        'D',
                                        'F',
                                        'NotApplicable'
                                      ],
                                      ontap: (value) {
                                        if (value != null) {
                                    signalCondition = value.toString();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          enabled: enabletextfrom,
                                          controller: signalNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller:signalCommentController,

                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Roundabout',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                      height: height * 0.04,
                                      widht: width * 0.25,
                                      hint_txt: roundAvailabilty,
                                      dropdownOptions: ['Yes', 'No', 'Few'],
                                      ontap: (value) {
                                        if (value != null) {
                                     roundAvailabilty =value.toString();
                                        }
                                      },
                                    ),
                                    MyDropdownButton(
                                      height: height * 0.04,
                                      widht: width * 0.35,
                                      hint_txt: roundCondition,
                                      dropdownOptions: [
                                        'A',
                                        'B',
                                        'C',
                                        'D',
                                        'F',
                                        'NotApplicable'
                                      ],
                                      ontap: (value) {
                                        if (value != null) {
                                   roundCondition= value.toString();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: roundNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: roundCommentController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Road Side',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: roadSideAvailability,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            roadSideAvailability= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: roadSideCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                  roadSideCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: roadsideNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: roadsideCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Sign Boards',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: signbordAvailabilty,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            signbordAvailabilty= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: signboardCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            signboardCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: signNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: signCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),

                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Kerb',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.2,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: kerbAvailability,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                           kerbAvailability = value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: kerbCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            kerbCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: kerbNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: kerbCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Cat Eyes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.12,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: catEyeAvailability,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                         catEyeAvailability=value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: catEyeConditon,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            catEyeConditon= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: catEyesNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: catEyesCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Divider',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.14,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: dividerAvailability,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            dividerAvailability= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: dividerCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            dividerCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: dividerNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: dividerCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Markation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: marktionAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                       marktionAvailibility = value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt:marktionCondition ,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            marktionCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: markationNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: markationCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Road Shoulder',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: roadShoulderAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            roadShoulderAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: roadShoulderCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            roadShoulderCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: roadshoulderNumController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: roadShoulderCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Road-side Bus Stop(Shade)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: shadeAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            shadeAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt:shadeCondition ,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            shadeCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: shadeNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: shadeCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Road-side Bus Stop (Bench)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: benchAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            benchAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: benchCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            benchCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: benchnumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: benchCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Encroachment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: encromentAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            encromentAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: encromentCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            encromentCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: encromentNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: encromentCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Green Belt',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.14,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: greebAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            greebAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: greenCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            greenCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: greenNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: greenCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Footpath',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.16,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt:footpathAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            footpathAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: footpathCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            footpathCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: footNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: footCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Street Lights',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.1,
                                    ),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.25,
                                        hint_txt: streetlightAvailibility,
                                        dropdownOptions: ['Yes', 'No', 'Few'],
                                        ontap: (value) {
                                          if (value != null) {
                                            streetlightAvailibility= value.toString();
                                          }
                                        }),
                                    MyDropdownButton(
                                        height: height * 0.04,
                                        widht: width * 0.35,
                                        hint_txt: streetlightCondition,
                                        dropdownOptions: [
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'F',
                                          'NotApplicable'
                                        ],
                                        ontap: (value) {
                                          if (value != null) {
                                            streetlightCondition= value.toString();
                                          }
                                        }),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          keyboardType: TextInputType.numberWithOptions(),
                                          controller: streetNumberController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                    SizedBox(
                                        height: height * 0.04,
                                        width: width * 0.22,
                                        child: TextFormField(
                                          controller: streetCommentsController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.black))),
                                        )),
                                  ],
                                ),
                              ),
                              Text('Overall Road Furniture Condition (A, B, C, D, F)'),
                              MyDropdownButton(
                                  height: height * 0.04,
                                  widht: width / 2,
                                  hint_txt: furnitureCondition,
                                  dropdownOptions: [
                                    'A',
                                    'B',
                                    'C',
                                    'D',
                                    'F',
                                  ],
                                  ontap: (value) {
                                    if (value != null) {
                                      furnitureCondition= value.toString();
                                    }
                                  }),
                              Text('Comments/Remarks'),
                              SizedBox(
                                  height: height * 0.04,
                                  width: width * 0.8,
                                  child: TextFormField(
                                    controller: lastCommentsController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black))),
                                  )),
                              SizedBox(height: height*0.04,),
                              InkWell(
                                  onTap: ()async{

                             final furniture_db = FirebaseFirestore.instance.collection('road_furniture');
                                    //       final dbset = await FirebaseFirestore.instance.collection('draft').where('id',isEqualTo: id).where('roadName',isEqualTo:road_Name).get();
                             String newId = furniture_db.doc().id ;
                             if(typeOfCarriage.isNotEmpty && typeOfRoad.isNotEmpty && no_of_lane.isNotEmpty && no_of_width.isNotEmpty
                             && total_road_width.isNotEmpty && signalAvailabilty.isNotEmpty && signalCondition.isNotEmpty && roundAvailabilty.isNotEmpty &&
                             roundCondition.isNotEmpty &&  roadSideAvailability.isNotEmpty && roadSideCondition.isNotEmpty && kerbAvailability.isNotEmpty && kerbCondition.isNotEmpty && catEyeAvailability.isNotEmpty
                             && catEyeConditon.isNotEmpty && dividerAvailability.isNotEmpty && dividerCondition.isNotEmpty && marktionAvailibility.isNotEmpty && marktionCondition.isNotEmpty &&  roadShoulderAvailibility.isNotEmpty && roadShoulderCondition.isNotEmpty && shadeAvailibility.isNotEmpty && shadeCondition.isNotEmpty
                              && benchCondition.isNotEmpty &&  encromentAvailibility.isNotEmpty && encromentCondition.isNotEmpty
                                 &&  greebAvailibility.isNotEmpty && greenCondition.isNotEmpty
                                 &&  footpathAvailibility.isNotEmpty && streetlightAvailibility.isNotEmpty && commentsController.text.isNotEmpty
                                 &&  signalNumberController.text.isNotEmpty && signalCommentController.text.isNotEmpty
                                 &&  roundNumberController.text.isNotEmpty && roundCommentController.text.isNotEmpty
                                 &&  roadsideCommentsController.text.isNotEmpty && roadsideNumberController.text.isNotEmpty
                                 &&  signNumberController.text.isNotEmpty && signCommentsController.text.isNotEmpty
                                 &&  kerbNumberController.text.isNotEmpty && kerbCommentsController.text.isNotEmpty
                                 &&  shadeNumberController.text.isNotEmpty && shadeCommentsController.text.isNotEmpty
                                 &&  benchnumberController.text.isNotEmpty && benchCommentsController.text.isNotEmpty
                             ){
                               setState(() {
                                 ischeck = true;
                               });
                               furniture_db.doc(id).set({
                                 'id':newId,
                                 'no_of_lane': numberoflaneController.text,
                                 'no_of_width': widthofLaneController.text,
                                 'total_road_width': totalroadWidthContrller.text,
                                 'comments': commentsController.text,
                                 'remarks': remarksControlller.text,
                                 'typeOfCarriage': typeOfCarriage,
                                 'road_Name': roadNameController.text,
                                 'singal_availability':signalAvailabilty ,
                                 'singal_condition':signalCondition,
                                 'singal_number':signalNumberController.text,
                                 'singal_comments': signalCommentController.text,
                                 'roundAbout_availability': roundAvailabilty,
                                 'roundAbout_condition': roundCondition,
                                 'roundAbout_number': roundNumberController.text,
                                 'roundAbout_comments': roundCommentController.text,
                                 'roadSide_availability': roadSideAvailability,
                                 'roadSide_condition': roadSideCondition,
                                 'roadSide_number': roadsideNumberController.text,
                                 'roadSide_comments': roadsideCommentsController.text,
                                 'signBoard_availability': signbordAvailabilty,
                                 'signBoard_condition': signboardCondition,
                                 'signBoard_number': signNumberController.text,
                                 'signBoard_comments': signCommentsController.text,
                                 'kerb_availability': kerbAvailability,
                                 'kerb_condition': kerbCondition,
                                 'kerb_number': kerbNumberController.text,
                                 'kerb_comments': kerbCommentsController.text,
                                 'catEyes_availability': catEyeAvailability,
                                 'catEyes_condition': catEyeConditon,
                                 'catEyes_number': catEyesNumberController.text,
                                 'catEyes_comments': catEyesCommentsController.text,
                                 'divider_availability': dividerAvailability,
                                 'divider_condition': dividerCondition,
                                 'divider_number': dividerNumberController.text,
                                 'divider_comments': dividerCommentsController.text,
                                 'markation_availability': marktionAvailibility,
                                 'markation_condition': marktionCondition,
                                 'markation_number': markationNumberController.text,
                                 'markation_comments': markationCommentsController.text,
                                 'roadShoulder_availability': roadShoulderAvailibility,
                                 'roadShoulder_condition': roadShoulderCondition,
                                 'roadShoulder_number': roadshoulderNumController.text,
                                 'roadShoulder_comments': roadShoulderCommentsController.text,
                                 'roadSideBusShader_availability': shadeAvailibility,
                                 'roadSideBusShader_condition': shadeCondition,
                                 'roadSideBusShader_number': shadeNumberController.text,
                                 'roadSideBusShader_comments': shadeCommentsController.text,
                                 'roadSideBusbench_availability': benchAvailibility,
                                 'roadSideBusbench_condition': benchCondition,
                                 'roadSideBusbench_number': benchnumberController.text,
                                 'roadSideBusbench_comments': benchCommentsController.text,
                                 'encroachment_availability': encromentAvailibility,
                                 'encroachment_condition': encromentCondition,
                                 'encroachment_number': encromentNumberController.text,
                                 'encroachment_comments': encromentCommentsController.text,
                                 'greenbelt_availability': greebAvailibility,
                                 'greenbelt_condition': greenCondition,
                                 'greenbelt_number': greenNumberController.text,
                                 'greenbelt_comments': greenCommentsController.text,
                                 'footpath_availability': footpathAvailibility,
                                 'footpath_condition': footpathCondition,
                                 'footpath_number': footNumberController.text,
                                 'footpath_comments': footCommentsController.text,
                                 'streetlight_availability': streetlightAvailibility,
                                 'streetlight_condition': streetlightCondition,
                                 'streetlight_number': streetNumberController.text,
                                 'streetlight_comments': streetCommentsController.text,
                                 'furnitureCondition': furnitureCondition,
                                 'lastComments': lastCommentsController.text,
                                 'name': nameController.text,
                                 'phone': phoneController.text,
                                 'city': cityController.text,
                                 'district': districController.text,
                                 //      'concernedDepartment': ,
                                 'roadName': roadNameController.text,
                                 'typeOfRoad': typeOfRoad,
                               }).then((value) {
                                 setState(() {
                                   ischeck= false ;
                                 });
                                 final draft = FirebaseFirestore.instance.collection('draft');
                                 draft.doc(id).delete();
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SucessfullyScreen(),));
                               });
                             }else {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Fill all the fileds !')));
                             }
                                  },
                                  child:ischeck?CircularProgressIndicator():stylish_button(txt_for_container: 'Upload', height: height*0.05, width: width*0.6))
                            ],
                          ),
                        ),
                      ));
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
