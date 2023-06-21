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
//
// class RoadAssisment_Single extends StatelessWidget {
//   RoadAssisment_Single({Key? key}) : super(key: key);
//   TextEditingController noOfLaneController = TextEditingController();
//   TextEditingController widthOfLaneController = TextEditingController();
//   TextEditingController totalwidthController = TextEditingController();
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
//                 child: Center(child: Lottie.asset('assets/working.json')),
//               ),
//             ),
//             Container(
//               height: height * 0.6,
//               width: width,
//               child: Column(
//                 children: [
//                   Text('*No. of Lanes (both sides)'),
//                   SizedBox(
//                     height: height * 0.03,
//                   ),
//                   SizedBox(height: height*0.1,
//                     width: width*0.7,
//                     child: TextFormField(
//                       controller: noOfLaneController,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       decoration: InputDecoration(
//                           hintText: 'No of Lanes',
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black))),
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.01,
//                   ),
//                   Text('*Width of One lane (ft)'),
//                   SizedBox(height: height*0.1,
//                     width: width*0.7,
//                     child: TextFormField(
//                       controller: widthOfLaneController,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       decoration: InputDecoration(
//                           hintText: '*Width of One lane (ft)',
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black))),
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.01,
//                   ),
//                   Text('*Total Road width (ft)'),
//                   SizedBox(height: height*0.1,
//                     width: width*0.7,
//                     child: TextFormField(
//                       controller: totalwidthController,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       decoration: InputDecoration(
//                           hintText: '*Total Road width (ft)',
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black))),
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.05,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => GeneralInfo(),
//                         ));
//                       }
//                     },
//                     child: stylish_button(
//                         txt_for_container: 'Submit Records',
//                         height: height * 0.08,
//                         width: width * 0.8),
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
