import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/DualCariagetype.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Furniture_Screen.dart';

import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../Custome_Widget/DropDownButton.dart';
import '../Custome_Widget/expandableCard.dart';

class RoadDimensionScreen extends StatefulWidget {
    RoadDimensionScreen({Key? key, this.carriagetype}) : super(key: key);
  String? carriagetype ;
  @override
  State<RoadDimensionScreen> createState() => _RoadDimensionScreenState();
}

class _RoadDimensionScreenState extends State<RoadDimensionScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  final observationController = TextEditingController();
  final remarksController = TextEditingController();
  final noOfLanesController = TextEditingController();
  final widthofController = TextEditingController();
  final totalroadController = TextEditingController();
  final GlobalKey<FormState> keyy = GlobalKey<FormState>();
  List<Map<String, dynamic>> listOfController = [];
  List<Map<String, Widget>> listOfFields = [];
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var obj = {
      'locationbtn': '',
      'item': "",
      'observation':observationController,
      'remarks': remarksController,
    };

    listOfController.add(obj);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    print(listOfController.length.toString());
    print('buld has been called ');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.freshgreen,
          title: Text('Road Condition Assessment'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: keyy,
            child: Column(children: [
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Text(


                  'Road Dimensions',
                  style: TextStyle(
                      fontSize: height * 0.015, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),

                  controller:noOfLanesController,
                  validator: RequiredValidator(errorText: '*Required'),
                  decoration: InputDecoration(
                      hintText: 'Number of lanes',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),

                  controller:widthofController,
                  validator: RequiredValidator(errorText: '*Required'),
                  decoration: InputDecoration(
                      hintText: 'Width of one lane (ft)',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.03,

              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller:totalroadController,
                  validator: RequiredValidator(errorText: '*Required'),
                  decoration: InputDecoration(
                      hintText: 'Total Road Width (ft)',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Road Assessment Both Sides (⇔)',
                style: TextStyle(fontSize: height * 0.02),
              ),
              Container(
                  height: height * 0.45,
                  child: ListView.builder(
                    itemCount: listOfController.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(border: Border.all(color: AppColors.freshgreen!,width: width*0.02)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:Container(
                                color: Colors.black12,
                                child: Column(children: [
                                  Text('Start of Road Section'),
                                  InkWell(
                                      onTap: (){},
                                      child: Card(child: Center(child: Text('Current location')),)),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Card(child: Center(child: Text('Use Map')),)),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: Card(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [Icon(Icons.camera_alt),Text('Upload Image')])),),
                                  Text('Road Condition Assessment'),

                                ],),
                              ),
                            ),
                            MyDropdownButtonn(
                              dropdownItems: ['ALLIGATOR CRACKINGS','BLOCK CRACKING','FATIGUE CRACKS','POTHOLES','BLOWOUTS','RUTTING','SINKHOLE','RAVELLING','SHOVING','UPHEAVAL','PEELING','NO MAJOR FAILURE','UNDER CONSTRUCTION','RIGID PAVEMENT','UNPAVED ROAD'],
                              height: height,onChanged: (value, index) {
                              int myindex= 0 ;
                              Map<String, dynamic> obj =
                              listOfController[myindex];
                              obj['item'] = value;
                              listOfController[myindex] = obj;
                            },),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.05),
                              child: TextFormField(decoration: InputDecoration(hintText: 'Comments',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black38))),),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.05),
                              child: TextFormField(decoration: InputDecoration(hintText: 'Remarks',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black38))),),
                            ),
                            Text('Road Condition (A, B, C, D, F)'),
                            MyDropdownButtonn(
                              dropdownItems:['A','B','C','D','E','F'],
                              height: height,onChanged: (value, index) {
                              int myindex= 0 ;
                              Map<String, dynamic> obj =
                              listOfController[myindex];
                              obj['item'] = value;
                              listOfController[myindex] = obj;
                            },),
                            SizedBox(height: height*0.05,),


                          ],
                        ),
                      );
                    },
                  )),
               SizedBox(height: height*0.02,),

            ]),
          ),
        ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FloatingActionButton(
            backgroundColor: AppColors.freshgreen,
            heroTag: '1',
            onPressed: () {
              currentIndex++;
              var map = {
                'locationbtn': '',
                'item': "",
                'observation':observationController,
                'remarks': remarksController,
              };
              listOfController.add(map);
              setState(() {});
            },
            child: Icon(
              Icons.add,
            ),
          ),
          FloatingActionButton(
            heroTag: '2',
            backgroundColor: AppColors.freshgreen,
            onPressed: (){
              if(keyy.currentState!.validate()){
                if(widget.carriagetype == 'Single Carriageway'){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoadFurniture_Screen(),));
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DualCariageTypeScreen(),));
              }else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the fields ')));

              }


            },child: Text('Next'),),
        ],)
      ),
    );
  }



}


class MyDropdownButtonn extends StatefulWidget {
  MyDropdownButtonn({required this.dropdownItems,required this.height,required this.onChanged});
  Function(String? value, int? index)? onChanged;
  double height ;
  int? index;
  List dropdownItems ;
  @override
  _MyDropdownButtonnState createState() => _MyDropdownButtonnState(dropdownItems: dropdownItems);
}
//['ALLIGATOR CRACKINGS','BLOCK CRACKING','FATIGUE CRACKS','POTHOLES','BLOWOUTS','RUTTING','SINKHOLE','RAVELLING','SHOVING','UPHEAVAL','PEELING','NO MAJOR FAILURE','UNDER CONSTRUCTION','RIGID PAVEMENT','UNPAVED ROAD'];
class _MyDropdownButtonnState extends State<MyDropdownButtonn> {
  _MyDropdownButtonnState({required this.dropdownItems});
  String? _selectedItem  ;
  List dropdownItems ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.freshgreen,
      child: Center(
        child: DropdownButton<String>(
          hint: Text('Select',style: TextStyle(color: Colors.white),),
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          menuMaxHeight:widget.height*0.3 ,
          dropdownColor: AppColors.freshgreen,
          style: TextStyle(color: Colors.white),
          value: _selectedItem ,
          items: dropdownItems.map<DropdownMenuItem<String>>((dynamic value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue;
              widget.onChanged!(newValue, widget.index);
              print(_selectedItem.toString());
            });


          },
        ),
      ),
    );
  }
}







































//
// Container(
// color: Colors.black12,
// child: Column(children: [
// Text('Start of Road Section'),
// InkWell(
// onTap: (){},
// child: Card(child: Center(child: Text('Current location')),)),
// InkWell(
// onTap: (){},
// child: Card(child: Center(child: Text('Use Map')),)),
// InkWell(
// onTap: (){},
// child: Card(child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [Icon(Icons.camera_alt),Text('Upload Image')])),),
// Text('Road Condition Assessment'),
// ],),
// ),