import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/Custome_Widget/DropDownButton.dart';
import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

class DualCariageTypeScreen extends StatefulWidget {
  const DualCariageTypeScreen({Key? key}) : super(key: key);

  @override
  State<DualCariageTypeScreen> createState() => _DualCariageTypeScreenState();
}

class _DualCariageTypeScreenState extends State<DualCariageTypeScreen> {
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
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Road Furniture Condition Assessment Direction One (→)'),
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
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Signals', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.1,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Roundabout', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road Side', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(

                      decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Sign Boards', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Kerb', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.2,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Cat Eyes', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.12,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Divider', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.14,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              ////
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Markation', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road Shoulder', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.04,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road-side Bus Stop(Shade)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.02,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road-side Bus Stop (Bench)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Encroachment', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Green Belt', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.14,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Footpath', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.16,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Street Lights', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.1,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              Text('Overall Road Furniture Condition (A, B, C, D, F)'),
              MyDropdownButton(height: height*0.04, widht: width/2, hint_txt: 'Select Condition', dropdownOptions: ['A','B','C','D','F',]),
              Text('Comments/Remarks'),
              SizedBox(
                  height: height*0.04,
                  width: width*0.8,
                  child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
            SizedBox(height: height*0.05,),
              Text('Road Furniture Condition Assessment Direction Two (←) '),
              SizedBox(height: height*0.03,),
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
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Signals', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.1,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Roundabout', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road Side', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(

                      decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Sign Boards', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Kerb', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.2,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Cat Eyes', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.12,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Divider', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.14,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              ////
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Markation', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road Shoulder', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.04,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road-side Bus Stop(Shade)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.02,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Road-side Bus Stop (Bench)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Encroachment', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.08,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Green Belt', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.14,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Footpath', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.16,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              FittedBox(child: Row(children: [
                Text('Street Lights', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),SizedBox(width: width*0.1,),
                MyDropdownButton(height: height*0.04, widht: width*0.25, hint_txt:'', dropdownOptions: ['Yes','No','Few']),
                MyDropdownButton(height: height*0.04, widht: width*0.35, hint_txt:'', dropdownOptions: ['A','B','C','D','F','NotApplicable']),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
                SizedBox(
                    height: height*0.04,
                    width: width*0.22,
                    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              ],),),
              SizedBox(height: height*0.02,),
              Text('Overall Road Furniture Condition (A, B, C, D, F)'),
              MyDropdownButton(height: height*0.04, widht: width/2, hint_txt: 'Select Condition', dropdownOptions: ['A','B','C','D','F',]),
              Text('Comments/Remarks'),
              SizedBox(
                  height: height*0.04,
                  width: width*0.8,
                  child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),)),
              stylish_button(txt_for_container: 'Submit', height: height*0.04, width: width/2)
            ],
          ),
        ),
      ),
    );
  }
}
