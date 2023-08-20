import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/General_Screen/NameContactScreen.dart';
import 'package:mam_sana_afzal/General_Screen/draftScreen.dart';
import 'package:mam_sana_afzal/Modal_Class/ModalClass.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../General_Screen/Sucessfully_Screen.dart';

class RoadFurniture_Screen extends StatefulWidget {
  RoadFurniture_Screen({Key? key}) : super(key: key);

  @override
  State<RoadFurniture_Screen> createState() => _RoadFurniture_ScreenState();
}

class _RoadFurniture_ScreenState extends State<RoadFurniture_Screen> {
  final signalNumberController = TextEditingController();
  final signalCommentsController = TextEditingController();
  final roundNumberController = TextEditingController();
  final roundCommentNumberController = TextEditingController();
  final roadsideNumberController = TextEditingController();
  final roadsideCommentsController = TextEditingController();
  final signNumberController = TextEditingController();
  final signCommentsController = TextEditingController();
  final kerbNumberController = TextEditingController();
  final kerbCommentsController = TextEditingController();
  final catEyesNumberController = TextEditingController();
  final catEyesCommentsController = TextEditingController();
  final dividerNumberController = TextEditingController();
  final dividerCommentsController = TextEditingController();
  final markationNumberController = TextEditingController();
  final markationCommentsController = TextEditingController();
  final roadshoulderNumController = TextEditingController();
  final roadShoulderCommentsController = TextEditingController();
  final shadeNumberController = TextEditingController();
  final shadeCommentsController = TextEditingController();
  final benchnumberController = TextEditingController();
  final benchCommentsController = TextEditingController();
  final encromentNumberController = TextEditingController();
  final encromentCommentsController = TextEditingController();
  final greenNumberController = TextEditingController();
  final greenCommentsController = TextEditingController();
  final footNumberController = TextEditingController();
  final footCommentsController = TextEditingController();
  final streetNumberController = TextEditingController();
  final streetCommentsController = TextEditingController();
  final lastCommentsController = TextEditingController();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
    signalNumberController.dispose();
    signalCommentsController.dispose();
    roundNumberController.dispose();
    roundCommentNumberController.dispose();
    roadsideNumberController.dispose();
    roadsideCommentsController.dispose();
    signNumberController.dispose();
    signCommentsController.dispose();
    kerbNumberController.dispose();
    kerbCommentsController.dispose();
    catEyesNumberController.dispose();
    catEyesCommentsController.dispose();
    dividerNumberController.dispose();
    dividerCommentsController.dispose();
    markationNumberController.dispose();
    markationCommentsController.dispose();
    roadshoulderNumController.dispose();
    roadShoulderCommentsController.dispose();
    shadeNumberController.dispose();
    shadeCommentsController.dispose();
    benchnumberController.dispose();
    benchCommentsController.dispose();
    encromentNumberController.dispose();
    encromentCommentsController.dispose();
    greenNumberController.dispose();
    greenCommentsController.dispose();
    footNumberController.dispose();
    footCommentsController.dispose();
    streetNumberController.dispose();
    streetCommentsController.dispose();
    lastCommentsController.dispose();
  }
  bool condtion =true ;
  final keyy = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.freshgreen,
          title: Text(
            'Road Furniture Condition Both Sides (⇔)',
            style: TextStyle(fontSize: height * 0.015),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: keyy,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        'Road Furniture:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        '	Availability:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        'Condition:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        'Numbers:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        'Comments:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (signalva) {
                            if (signalva != null) {
                              DataModal.singal_availability = signalva!;
                           condtion = signalva == 'No' ? false:true;
                           setState(() {
                           });
                            }
                          }),
                      MyDropdownButton(
                        height: height * 0.04,
                        widht: width * 0.35,
                        hint_txt: '',

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
                            DataModal.singal_condition = value!;
                          }
                        }  ,
                      ),
                      SizedBox(
                          height: height * 0.04,
                          width: width * 0.22,
                          child: TextFormField(
                            enabled: condtion,
                            keyboardType: TextInputType.numberWithOptions(),
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
                            enabled: condtion,
                            controller: signalCommentsController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
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
                        hint_txt: '',
                        dropdownOptions: ['Yes', 'No', 'Few'],
                        ontap: (value) {
                          if (value != null) {
                            DataModal.roundAbout_availability = value;
                                (value) => value == null ? 'field required' : null;

                          }
                        },
                      ),
                      MyDropdownButton(
                        height: height * 0.04,
                        widht: width * 0.35,
                        hint_txt: '',
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
                            DataModal.roundAbout_condition = value;
                            (value) => value == null ? 'field required' : null;
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
                            controller: roundCommentNumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.roadSide_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.roadSide_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.signBoard_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.signBoard_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.kerb_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.kerb_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.catEyes_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.catEyes_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.divider_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.divider_condition = value;
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
                ////
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.markation_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.markation_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.roadShoulder_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.roadShoulder_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.roadSideBusShader_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.roadSideBusShader_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.roadSideBusbench_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.roadSideBusbench_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.encroachment_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.encroachment_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.greenbelt_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.greenbelt_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.footpath_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.footpath_condition = value;
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
                SizedBox(
                  height: height * 0.02,
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
                          hint_txt: '',
                          dropdownOptions: ['Yes', 'No', 'Few'],
                          ontap: (value) {
                            if (value != null) {
                              DataModal.streetlight_availability = value;
                            }
                          }),
                      MyDropdownButton(
                          height: height * 0.04,
                          widht: width * 0.35,
                          hint_txt: '',
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
                              DataModal.streetlight_condition = value;
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
                SizedBox(
                  height: height * 0.02,
                ),
                Text('Overall Road Furniture Condition (A, B, C, D, F)'),
                MyDropdownButton(
                    height: height * 0.04,
                    widht: width / 2,
                    hint_txt: 'Select Condition',
                    dropdownOptions: [
                      'A',
                      'B',
                      'C',
                      'D',
                      'F',
                    ],
                    ontap: (value) {
                      if (value != null) {
                        DataModal.furnitureCondition = value;
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

                ///draft button here !
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            isloading = true;
                          });

                          DataModal.draft ='draft';
                          DataModal.singal_number = signalNumberController.text;
                          DataModal.singal_comments =
                              signalCommentsController.text;
                          DataModal.roundAbout_number =
                              roundNumberController.text;
                          DataModal.roundAbout_comments =
                              roundCommentNumberController.text;
                          DataModal.roadSide_number =
                              roadsideNumberController.text;
                          DataModal.roadSide_comments =
                              roadsideCommentsController.text;
                          DataModal.signBoard_number = signNumberController.text;
                          DataModal.signBoard_comments =
                              signCommentsController.text;
                          DataModal.kerb_number = kerbNumberController.text;
                          DataModal.kerb_comments = kerbCommentsController.text;
                          DataModal.catEyes_number = catEyesNumberController.text;
                          DataModal.catEyes_comments =
                              catEyesCommentsController.text;
                          DataModal.divider_number = dividerNumberController.text;
                          DataModal.divider_comments =
                              dividerCommentsController.text;
                          DataModal.markation_number =
                              markationNumberController.text;
                          DataModal.markation_comments =
                              markationCommentsController.text;
                          DataModal.roadShoulder_number =
                              roadshoulderNumController.text;
                          DataModal.roadShoulder_comments =
                              roadShoulderCommentsController.text;
                          DataModal.roadSideBusShader_number =
                              shadeNumberController.text;
                          DataModal.roadSideBusShader_comments =
                              shadeCommentsController.text;
                          DataModal.roadSideBusbench_number =
                              benchnumberController.text;
                          DataModal.roadSideBusbench_comments =
                              benchCommentsController.text;
                          DataModal.encroachment_number =
                              encromentNumberController.text;
                          DataModal.encroachment_comments =
                              encromentCommentsController.text;
                          DataModal.greenbelt_number = greenNumberController.text;
                          DataModal.greenbelt_comments =
                              greenCommentsController.text;
                          DataModal.footpath_number = footNumberController.text;
                          DataModal.footpath_comments =
                              footCommentsController.text;
                          DataModal.streetlight_number =
                              streetNumberController.text;
                          DataModal.streetlight_comments =
                              streetCommentsController.text;
                          DataModal.lastComments = lastCommentsController.text;
                          await DataModal.storedataAsDraft();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DraftScreen(),));
                          // await DataModal.uploadContactInfomation();
                          // await DataModal.generalRoadDetails();
                          // await DataModal.uploadList();
                          // await DataModal.uploadDataFurniture();
                          // FocusManager.instance.primaryFocus.unfocus();
                          setState(() {
                            isloading = false;
                          });
                        },
                        child: stylish_button(
                          width: width *0.5,
                          height: height * 0.04,
                          txt_for_container: 'Save in Draft',
                        ),
                      ),
                    ),

                    ///submit button
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if (DataModal.singal_availability.isNotEmpty &&
                              DataModal.singal_condition.isNotEmpty &&
                              DataModal.singal_condition.isNotEmpty &&
                              DataModal.roundAbout_availability.isNotEmpty&&
                              DataModal.roundAbout_condition.isNotEmpty &&
                              DataModal.roadSide_availability.isNotEmpty &&
                              DataModal.roadSide_condition.isNotEmpty &&
                              DataModal.signBoard_availability.isNotEmpty &&
                              DataModal.signBoard_condition.isNotEmpty &&
                              DataModal.kerb_availability.isNotEmpty &&
                              DataModal.kerb_condition.isNotEmpty &&
                              DataModal.catEyes_availability.isNotEmpty &&
                              DataModal.catEyes_condition.isNotEmpty&&
                              DataModal.divider_availability.isNotEmpty &&
                              DataModal.divider_condition.isNotEmpty &&
                              DataModal.markation_availability.isNotEmpty &&
                              DataModal.markation_condition.isNotEmpty&&
                              DataModal.roadShoulder_availability.isNotEmpty &&
                              DataModal.roadShoulder_condition.isNotEmpty &&
                              DataModal.roadSideBusShader_availability.isNotEmpty &&
                              DataModal.roadSideBusShader_condition.isNotEmpty &&
                              DataModal.roadSideBusbench_availability.isNotEmpty &&
                              DataModal.roadSideBusbench_condition .isNotEmpty &&
                              DataModal.encroachment_availability.isNotEmpty &&
                              DataModal.encroachment_condition .isNotEmpty &&
                              DataModal.greenbelt_availability .isNotEmpty &&
                              DataModal.greenbelt_condition.isNotEmpty &&
                              DataModal.footpath_availability .isNotEmpty &&
                              DataModal.footpath_condition .isNotEmpty &&
                              DataModal.streetlight_availability.isNotEmpty &&
                              DataModal.streetlight_condition.isNotEmpty&&
                              DataModal.furnitureCondition.isNotEmpty) {
                            setState(() {
                              isloading = true;
                            });
                            DataModal.singal_number = signalNumberController.text;
                            DataModal.singal_comments =
                                signalCommentsController.text;
                            DataModal.roundAbout_number =
                                roundNumberController.text;
                            DataModal.roundAbout_comments =
                                roundCommentNumberController.text;
                            DataModal.roadSide_number =
                                roadsideNumberController.text;
                            DataModal.roadSide_comments =
                                roadsideCommentsController.text;
                            DataModal.signBoard_number =
                                signNumberController.text;
                            DataModal.signBoard_comments =
                                signCommentsController.text;
                            DataModal.kerb_number = kerbNumberController.text;
                            DataModal.kerb_comments = kerbCommentsController.text;
                            DataModal.catEyes_number =
                                catEyesNumberController.text;
                            DataModal.catEyes_comments =
                                catEyesCommentsController.text;
                            DataModal.divider_number =
                                dividerNumberController.text;
                            DataModal.divider_comments =
                                dividerCommentsController.text;
                            DataModal.markation_number =
                                markationNumberController.text;
                            DataModal.markation_comments =
                                markationCommentsController.text;
                            DataModal.roadShoulder_number =
                                roadshoulderNumController.text;
                            DataModal.roadShoulder_comments =
                                roadShoulderCommentsController.text;
                            DataModal.roadSideBusShader_number =
                                shadeNumberController.text;
                            DataModal.roadSideBusShader_comments =
                                shadeCommentsController.text;
                            DataModal.roadSideBusbench_number =
                                benchnumberController.text;
                            DataModal.roadSideBusbench_comments =
                                benchCommentsController.text;
                            DataModal.encroachment_number =
                                encromentNumberController.text;
                            DataModal.encroachment_comments =
                                encromentCommentsController.text;
                            DataModal.greenbelt_number =
                                greenNumberController.text;
                            DataModal.greenbelt_comments =
                                greenCommentsController.text;
                            DataModal.footpath_number = footNumberController.text;
                            DataModal.footpath_comments =
                                footCommentsController.text;
                            DataModal.streetlight_number =
                                streetNumberController.text;
                            DataModal.streetlight_comments =
                                streetCommentsController.text;
                            DataModal.lastComments = lastCommentsController.text;
                            await DataModal.uploadDataFurniture();
                            // FocusManager.instance.primaryFocus.unfocus();
                            setState(() {
                              isloading = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SucessfullyScreen(),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Select all the fields!')));
                          }
                        },
                        child: isloading
                            ? Center(child: CircularProgressIndicator())
                            : stylish_button(
                                txt_for_container: 'Submit',
                                height: height * 0.04,
                                width: width / 2),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
