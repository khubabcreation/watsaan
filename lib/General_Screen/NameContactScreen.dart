import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/General_Screen/General_Info_Screen.dart';
import 'package:mam_sana_afzal/Road/depricatedRoaddetauks.dart';
import 'package:mam_sana_afzal/RoadFrom/RoadDetailsScreen.dart';

import '../Modal_Class/ModalClass.dart';
import '../utils/Appcolor.dart';
import '../utils/StylishButton.dart';
import '../utils/clip_vendor.dart';
import '../utils/custom_Textform.dart';



class NameContactScreen extends StatefulWidget {
  NameContactScreen({Key? key}) : super(key: key);

  @override
  State<NameContactScreen> createState() => _NameContactScreenState();
}

class _NameContactScreenState extends State<NameContactScreen>
    with RestorationMixin {
  RestorableTextEditingController contactController =
  RestorableTextEditingController();

  RestorableTextEditingController cityController =
  RestorableTextEditingController();

  RestorableTextEditingController districController =
  RestorableTextEditingController();

  RestorableTextEditingController nameController =
  RestorableTextEditingController();

  RestorableTextEditingController dateController =
  RestorableTextEditingController();

  String concerddepart = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.darkblue!.withOpacity(0.8),
                          width: height * 0.01),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(height * 0.08))),
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .05,
                            width: width,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.arrow_back)),
                                  SizedBox(
                                    width: width * 0.25,
                                  ),
                                  Text('The Urban Unit ')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Image.asset('assets/urbanunit.png'),
                          SizedBox(
                              height: height * 0.1,
                              child: Image.asset('assets/watsaan.png')),
                        ],
                      )),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.8,
                  width: width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: CustomTextFormField(
                            controller: nameController.value,
                            hintText: 'Name',
                            validatorFunction:
                            RequiredValidator(errorText: '*Required'),
                            prefixIcon: Icons.person),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: CustomTextFormField(
                            controller: contactController.value,
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
                            controller: cityController.value,
                            hintText: 'City',
                            validatorFunction:
                            RequiredValidator(errorText: '*Required'),
                            prefixIcon: Icons.home_sharp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: CustomTextFormField(
                            controller: districController.value,
                            hintText: 'Distric',
                            validatorFunction:
                            RequiredValidator(errorText: '*Required'),
                            prefixIcon: Icons.account_balance),
                      ),
                      MyDropdownButton(
                        height: height * 0.04,
                        widht: width * 1,
                        hint_txt: 'Concerned Department/Agency (LG, NHA, C&W)',
                        dropdownOptions: ['LG', 'NHA', 'C&W'],
                        ontap: (value) {
                          concerddepart  = value.toString();
                        },
                      ),
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
                          controller: dateController.value,
                          validator: (value) {
                            if (dateController.value.text.isEmpty) {
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
                        onTap: ()async{
                          if (_formKey.currentState!.validate()) {
                            DataModal.name_of_person =
                                nameController.value.text;
                            DataModal.phone_of_person =
                                contactController.value.text;
                            DataModal.city = cityController.value.text;
                            DataModal.distric = districController.value.text;
                            DataModal.date = dateController.value.text;
                            DataModal.department = concerddepart ;
                            await DataModal.uploadContactInfomation();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RoadDetails(),
                            ));
                          }
                        },
                        child: stylish_button(
                            txt_for_container: 'Next',
                            height: height * 0.06,
                            width: width / 2),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'name_contact_screen'; // Unique identifier for state restoration

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(contactController, 'contact');
    registerForRestoration(cityController, 'city');
    registerForRestoration(districController, 'district');
    registerForRestoration(nameController, 'name');
    registerForRestoration(dateController, 'date');
  }
}