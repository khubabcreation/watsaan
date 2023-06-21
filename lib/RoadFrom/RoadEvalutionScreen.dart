import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../animation/animation_txt.dart';

class RoadEvalutionForm extends StatefulWidget {
  const RoadEvalutionForm({Key? key}) : super(key: key);

  @override
  State<RoadEvalutionForm> createState() => _RoadEvalutionFormState();
}

class _RoadEvalutionFormState extends State<RoadEvalutionForm> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:   EdgeInsets.all(8.0),
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
                      WavyAnimatedTextT("Road Evaluation Form",
                          speed: Duration(milliseconds: 200)),
                    ], isRepeatingAnimation: true, repeatForever: true),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Genaral Details',
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'Concerned Department/Agency (LG, NHA, C&W)',
                style: TextStyle(
                    fontSize: height * 0.014,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              MyDropdownButton(
                  height: height * 0.07,
                  widht: width * 0.7,
                  hint_txt: 'Details',
                  dropdownOptions: ['LG', 'NHA', 'C&W']),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Form Filled by (Name & Contact No)',
                style: TextStyle(
                    fontSize: height * 0.014,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Name & Contact No',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Name of City & District',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Area',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              stylish_button(txt_for_container: 'Next', height: height*0.075, width: width*0.6)
            ],
          ),
        ),
      ),
    );
  }
}
// Area
