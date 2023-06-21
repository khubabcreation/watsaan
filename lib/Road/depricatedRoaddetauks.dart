// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mam_sana_afzal/General_Info_Screen.dart';
//
// import '../Appcolor.dart';
// import '../Custome_Widget/DropDownButton.dart';
// import '../StylishButton.dart';
// import '../clip_vendor.dart';
// import '../custom_Textform.dart';
// import 'RoadAssiament_Single.dart';
//
// class RoadDetails extends StatelessWidget {
//   RoadDetails({Key? key}) : super(key: key);
//   TextEditingController roadNameController = TextEditingController();
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height - kToolbarHeight;
//     double width = MediaQuery.of(context).size.width;
//
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: Column(children: [
//             ClipPath(
//               clipper: clipper_vandor(),
//               child: Container(
//                 height: height * 0.4,
//                 width: width,
//                 color: AppColors.freshgreen,
//                 child: Center(child: Lottie.asset('assets/roadDetails.json')),
//               ),
//             ),
//             Text('Note: Area Name if Road Name is not found',style: TextStyle(fontSize: height*0.01),),
//
//             Container(
//               height: height * 0.6,
//               width: width,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: CustomTextFormField(
//                         controller: roadNameController,
//                         hintText: 'Road Name',
//                         validatorFunction:
//                             RequiredValidator(errorText: '*Required'),
//                         prefixIcon: Icons.person),
//                   ),
//                        MyDropdownButton(
//                     height: height * 0.08,
//                     widht: width * 0.8,
//                     hint_txt: 'Type of Road',
//                     dropdownOptions: [
//                       'Pirmary',
//                       'Secondary',
//                       'Other',
//                     ],
//                   ),
//                   SizedBox(height: height*0.05,),
//                   MyDropdownButton(
//                     height: height * 0.08,
//                     widht: width * 0.8,
//                     hint_txt: 'Type of Carriagaway',
//                     dropdownOptions: [
//                       'Single',
//                       'Dual',
//                     ],
//                   ),
//                   SizedBox(height: height*0.05,),
//                   InkWell(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => RoadAssisment_Single(),
//                         ));
//                       }
//                     },
//                     child: stylish_button(
//                         txt_for_container: 'Next',
//                         height: height * 0.08,
//                         width: width*0.8),
//                   )
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
