import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/Modal_Class/ModalClass.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../General_Screen/draftScreen.dart';
import '../animation/animation_txt.dart';
import '../single_Carriage_Screen/Road_Dimension_Screen.dart';

class RoadDetails extends StatefulWidget {
  const RoadDetails({Key? key}) : super(key: key);

  @override
  State<RoadDetails> createState() => _RoadDetailsState();
}

class _RoadDetailsState extends State<RoadDetails> with RestorationMixin {
  RestorableTextEditingController roadNamaController =
      RestorableTextEditingController();
  RestorableString upcommingValue= RestorableString('');
    RestorableString typeofRoad =  RestorableString('');
  RestorableString typeofCarriage= RestorableString('');
  final GlobalKey<FormState> keyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.freshgreen, actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DraftScreen(),
                ));
              },
              icon: Icon(Icons.history))
        ]),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: keyy,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: height * 0.2,
                    width: width,
                    color: AppColors.freshgreen,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.026),
                        duration: Duration(milliseconds: 200),
                        child: AnimatedTextKitT(animatedTexts: [
                          WavyAnimatedTextT("General Road Details",
                              speed: Duration(milliseconds: 200)),
                        ], isRepeatingAnimation: true, repeatForever: true),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Text(
                    'Road Name/ Area',
                    style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: TextFormField(
                      controller: roadNamaController.value,
                      validator:
                          RequiredValidator(errorText: 'Please Enter the Name'),
                      decoration: InputDecoration(
                          hintText: 'Enter Road Name/ Area',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  MyDropdownButton(
                    height: height * 0.07,
                    widht: width * 0.7,
                    hint_txt: 'Type of Road',
                    dropdownOptions: [
                      'Primary',
                      'Secondary',
                      'Tertiary',
                      'other'
                    ],
                    ontap: (value) {
                      if (value != null) {
                        typeofRoad.value = value!;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'Please Select your Type of Carriageway',
                    style: TextStyle(
                        fontSize: height * 0.014,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  MyDropdownButton(
                    height: height * 0.07,
                    widht: width * 0.7,
                    hint_txt: 'Type of Carriageway',
                    dropdownOptions: ['Single Carriageway', 'Dual Carriageway'],
                    ontap: (value) {
                      if (value != null) {
                        typeofCarriage.value  = value!;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  InkWell(
                      onTap: ()async{
                        if (keyy.currentState!.validate() &&
                            roadNamaController.value.text.isNotEmpty &&
                            typeofCarriage.value.isNotEmpty) {
                          DataModal.road_Name =
                              roadNamaController.value.text.trim();
                          DataModal.type_of_Road = typeofRoad.value;
                          DataModal.type_of_Carriagway = typeofCarriage.value;
                          DataModal.type_of_Carriagway = typeofCarriage.value;
                          await DataModal.generalRoadDetails();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RoadDimensionScreen(),
                          ));

                          ///single carig
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please fill all the fields ')));
                        }
                      },
                      child: stylish_button(
                          txt_for_container: 'Next',
                          height: height * 0.075,
                          width: width * 0.6))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => 'road_detail_screen'; // Unique identifier for state restoration

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(roadNamaController, 'road_name');
    registerForRestoration(typeofRoad, 'type_road');
    registerForRestoration(typeofCarriage, 'type_carriage');
    registerForRestoration(upcommingValue, 'upcommingValue');
  }

}

// Area
