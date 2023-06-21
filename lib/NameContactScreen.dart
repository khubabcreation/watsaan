import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/General_Info_Screen.dart';
import 'package:mam_sana_afzal/Road/depricatedRoaddetauks.dart';
import 'package:mam_sana_afzal/RoadFrom/RoadDetailsScreen.dart';

import 'utils/Appcolor.dart';
import 'utils/StylishButton.dart';
import 'utils/clip_vendor.dart';
import 'utils/custom_Textform.dart';

class NameContactScreen extends StatelessWidget {
  NameContactScreen({Key? key}) : super(key: key);
  TextEditingController contactController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                height: height*0.3,
              width: width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkblue!.withOpacity(0.8),width: height*0.01),
                    color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(height*0.08))),
                child: Center(child:Column(
                  children: [
                    SizedBox(height: height*0.04,),
                    Image.asset('assets/urbanunit.png'),
                    SizedBox(
                        height: height*0.1,
                        child: Image.asset('assets/watsaan.png')),
                  ],
                )),),
              SizedBox(height: height*0.05,),
              Container(
                height: height * 0.6,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextFormField(
                          controller: nameController,
                          hintText: 'Name',
                          validatorFunction:
                              RequiredValidator(errorText: '*Required'),
                          prefixIcon: Icons.person),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextFormField(
                          controller:contactController ,
                          textInputType: TextInputType.phone,
                          textlenght: 12,
                          listOfFormatter: [
                            MaskedInputFormatter('0000-0000000')
                          ],
                          validatorFunction:
                              RequiredValidator(errorText: '*Required'),
                          hintText: 'Phone',
                          prefixIcon: Icons.phone),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextFormField(
                          controller:cityController,
                          hintText: 'City',
                          validatorFunction:
                          RequiredValidator(errorText: '*Required'),
                          prefixIcon: Icons.home_sharp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextFormField(
                          controller: districController,
                          hintText: 'Distric',
                          validatorFunction:
                          RequiredValidator(errorText: '*Required'),
                          prefixIcon: Icons.account_balance),
                    ),
                    MyDropdownButton(height: height*0.04, widht: width*1, hint_txt: 'Concerned Department/Agency (LG, NHA, C&W)', dropdownOptions:  ['LG','NHA','C&W']),

                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.07,
                      child: DateTimePicker(
                        dateMask: 'd/MM/yyyy',
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_month),
                            hintText: 'Pick Date',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller:dateController  ,
                        validator: (value) {
                          if ( dateController.text.isEmpty) {
                            return 'Pick Date First';
                          }
                          return null;
                        },
                        type: DateTimePickerType.date,
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoadDetails(),));
                                }
                      },
                      child: stylish_button(
                          txt_for_container: 'Next',
                          height: height * 0.04,
                          width: width / 2),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
