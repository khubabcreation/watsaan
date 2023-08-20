import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mam_sana_afzal/Modal_Class/ModalClass.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/DualCariagetype.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Furniture_Screen.dart';

import 'package:mam_sana_afzal/utils/Appcolor.dart';
import 'package:mam_sana_afzal/utils/StylishButton.dart';

import '../Custome_Widget/DropDownButton.dart';
import '../Custome_Widget/expandableCard.dart';

class RoadDimensionScreen extends StatefulWidget {
  RoadDimensionScreen({Key? key, this.carriagetype}) : super(key: key);
  String? carriagetype;

  @override
  State<RoadDimensionScreen> createState() => _RoadDimensionScreenState();
}

class _RoadDimensionScreenState extends State<RoadDimensionScreen> with RestorationMixin {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  RestorableTextEditingController noOfLanesController = RestorableTextEditingController();
  RestorableTextEditingController widthofController = RestorableTextEditingController();
  RestorableTextEditingController totalroadController = RestorableTextEditingController();

  String currentLocation = '';

  String useMap = '';

  String uploadImage = '';

  RestorableTextEditingController commentsController = RestorableTextEditingController();
  RestorableTextEditingController remarksController = RestorableTextEditingController();
  RestorableTextEditingController lenghtController = RestorableTextEditingController();
  String address = '';
  bool? serviceEnabled;
  LocationPermission? permission;
  final GlobalKey<FormState> keyy = GlobalKey<FormState>();
  List<Map<String, dynamic>> listOfController = [];
  List<Map<String, Widget>> listOfFields = [];
  int currentIndex = 0;
  WriteBatch batch = FirebaseFirestore.instance.batch();
  File? _imageFile;
  File? imageFilee; /// public variable for second photo taker
  double? _latitude;
  double? _longitude;
  double? lat;
  double? long;

@override
  void dispose() {
    super.dispose();
    widthofController.dispose();
    noOfLanesController.dispose();
    totalroadController.dispose();
    commentsController.dispose();
    remarksController.dispose();
    lenghtController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var obj = {
      'currentLocation': '',
      // 'useMap':'',
      // 'uploadImage':'',
      'comments': commentsController,
      'remarks': remarksController,
      'lenght': lenghtController,
      'selectCondition': '',
      'roadConditionAssessment': '',
    };

    listOfController.add(obj);
  }

  ///image picker code ha ya ................
  bool isloading = false;
  bool isloadingone =false ;
  Future<void> _captureImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);

    _imageFile = File(pickedImage!.path);

  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  Future<void> _uploadImageAndLocationToFirestore() async {
    setState(() {
      isloading = true;
    });
    if (_imageFile != null && _latitude != null && _longitude != null) {
      // Create a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference the Firebase storage bucket and image path
      final storageReference = FirebaseStorage.instance.ref().child(fileName);

      // Upload the image file to Firebase Storage
      await storageReference.putFile(_imageFile!);

      // Get the download URL of the uploaded image
      String imageUrl = await storageReference.getDownloadURL();
      DataModal.image_url = imageUrl;
      DataModal.latitude = _latitude.toString();
      DataModal.longitude = _longitude.toString();
      DataModal.timestamp = FieldValue.serverTimestamp().toString();
      // Store the image URL and location in Firestore
      final dbimge = await FirebaseFirestore.instance.collection('images');
         DataModal.imageId  = dbimge.id ;
      dbimge.doc().set({
         'imageid'  :DataModal.imageId,
        'image_url': imageUrl,
        'latitude': _latitude,
        'longitude': _longitude,
        'timestamp': FieldValue.serverTimestamp(),
        'typeOfCarriage': DataModal.type_of_Carriagway,
        'roadName': DataModal.road_Name,
      });
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image and location uploaded successfully')),
      );
    } else {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Capture an image and retrieve location first')),
      );
    }
  }


  Future<void> captureImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.camera);

    imageFilee = File(pickedImage!.path);

  }
  Future<void> getCurrentLocationToendRoad() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lat  = position.latitude;
    long = position.longitude;
  }
  Future<void> uploadImageAndLocationToendRoad() async {
    setState(() {
      isloadingone = true;
    });
    if (imageFilee != null && lat != null && long != null) {
      // Create a unique filename for the image
      String fileName = DateTime.now().millisecond.toString();

      // Reference the Firebase storage bucket and image path
      final storageReference = FirebaseStorage.instance.ref().child(fileName);

      // Upload the image file to Firebase Storage
      await storageReference.putFile(imageFilee!);

      // Get the download URL of the uploaded image
      String imageUrll = await storageReference.getDownloadURL();
      DataModal.image_url = imageUrll;
      DataModal.lat = lat.toString();
      DataModal.long = long.toString();
      DataModal.timestamp = FieldValue.serverTimestamp().toString();
      // Store the image URL and location in Firestore
      await FirebaseFirestore.instance.collection('lastimages').add({

        'image_url': imageUrll,
        'latitude': lat,
        'longitude': long,
        'timestamp': FieldValue.serverTimestamp(),
        'typeOfCarriage': DataModal.type_of_Carriagway,
        'roadName': DataModal.road_Name,
      });
      setState(() {
         isloadingone =false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image and location uploaded successfully')),
      );
    } else {
      setState(() {
        isloadingone = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Capture an image and retrieve location first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.freshgreen,
            title: Text('Road Condition Assessment'),
          ),
          body: Form(
            key: keyy,
            child: SingleChildScrollView(
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
                    controller: noOfLanesController.value,
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
                    controller: widthofController.value,
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
                    controller: totalroadController.value,
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
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.freshgreen!,
                                  width: width * 0.02)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.black12,
                                  child: Column(
                                    children: [
                                      Text('Start of Road Section'),
                                      InkWell(
                                          onTap: () {
                                            _captureImage();
                                            _getCurrentLocation();
                                          },
                                          child: Card(
                                            child: Center(
                                                child: Text('Use Camera')),
                                          )),
                                      // InkWell(
                                      //     onTap: () async {
                                      //       serviceEnabled = await Geolocator
                                      //           .isLocationServiceEnabled();
                                      //       if (!serviceEnabled!) {
                                      //         return Future.error(
                                      //             'Location services are disabled');
                                      //       }
                                      //
                                      //       permission = await Geolocator
                                      //           .checkPermission();
                                      //       if (permission ==
                                      //           LocationPermission.denied) {
                                      //         permission = await Geolocator
                                      //             .requestPermission();
                                      //         if (permission ==
                                      //             LocationPermission.denied) {
                                      //           return Future.error(
                                      //               'Location permissions are denied');
                                      //         }
                                      //       }
                                      //
                                      //       if (permission ==
                                      //           LocationPermission
                                      //               .deniedForever) {
                                      //         return Future.error(
                                      //             'Location permissions are permanently denied, we cannot request permissions.');
                                      //       }
                                      //
                                      //       Position position = await Geolocator
                                      //           .getCurrentPosition(
                                      //           desiredAccuracy:
                                      //           LocationAccuracy.high);
                                      //       List<Placemark> placemarks =
                                      //       await placemarkFromCoordinates(
                                      //           position.latitude,
                                      //           position.longitude);
                                      //       if (placemarks.isNotEmpty) {
                                      //         Placemark placemark =
                                      //             placemarks.first;
                                      //         String formattedAddress =
                                      //             '${placemark.thoroughfare}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
                                      //         address = formattedAddress;
                                      //       }
                                      //
                                      //       ScaffoldMessenger.of(context)
                                      //           .showSnackBar(SnackBar(
                                      //           content: Text(
                                      //               'Location getted successfuly : $address')));
                                      //       Map<String, dynamic> obj =
                                      //       listOfController[index];
                                      //       obj['currentLocation'] = address;
                                      //       listOfController[index] = obj;
                                      //     },
                                      //     child: Card(
                                      //       child: Center(
                                      //           child:
                                      //           Text('Current location')),
                                      //     )),
                                      InkWell(
                                        onTap: () {
                                          _uploadImageAndLocationToFirestore();
                                        },
                                        child: isloading
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Card(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                    Icon(Icons.camera_alt),
                                                    Text('Upload Image')
                                                  ])),
                                      ),
                                      Text('Road Condition Assessment'),

                                    ],
                                  ),
                                ),
                              ),
                              MyDropdownButtonn(
                                dropdownItems: [
                                  'ALLIGATOR CRACKINGS',
                                  'BLOCK CRACKING',
                                  'FATIGUE CRACKS',
                                  'POTHOLES',
                                  'BLOWOUTS',
                                  'RUTTING',
                                  'SINKHOLE',
                                  'RAVELLING',
                                  'SHOVING',
                                  'UPHEAVAL',
                                  'PEELING',
                                  'NO MAJOR FAILURE',
                                  'UNDER CONSTRUCTION',
                                  'RIGID PAVEMENT',
                                  'UNPAVED ROAD'
                                ],
                                height: height,
                                onChanged: (value, index) {
                                  int? myindex = 0;

                                  Map<String, dynamic> obj =
                                      listOfController[myindex];
                                  obj['roadConditionAssessment'] = value;
                                  listOfController[myindex] = obj;
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.05),
                                child: TextFormField(
                                  controller: listOfController[index]
                                      ['comments'].value,
                                  decoration: InputDecoration(
                                      hintText: 'Comments',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black38))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.05),
                                child: TextFormField(
                                  controller: listOfController[index]
                                      ['remarks'].value,
                                  decoration: InputDecoration(
                                      hintText: 'Remarks',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black38))),
                                ),
                              ),
                              Text('Road Condition (A, B, C, D, F)'),
                              MyDropdownButtonn(
                                dropdownItems: ['A', 'B', 'C', 'D', 'E', 'F'],
                                height: height,
                                onChanged: (value, index) {
                                  int? myindex = 0;
                                  Map<String, dynamic> obj =
                                      listOfController[myindex];
                                  obj['selectCondition'] = value;
                                  listOfController[myindex] = obj;
                                },
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.05),
                                child: TextFormField(
                                  controller: listOfController[index]
                                  ['lenght'].value,
                                  decoration: InputDecoration(
                                      hintText: 'Length as per Condition (km)',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black38))),
                                ),
                              ),
                              SizedBox(height: height*0.02,),

                              Text('End of Road Section'),
                              InkWell(
                                  onTap: () {
                                    captureImage();
                                    getCurrentLocationToendRoad();
                                  },
                                  child: Card(
                                    child: Center(
                                        child: Text('Use Camera')),
                                  )),
                              // InkWell(
                              //     onTap: () async {
                              //       serviceEnabled = await Geolocator
                              //           .isLocationServiceEnabled();
                              //       if (!serviceEnabled!) {
                              //         return Future.error(
                              //             'Location services are disabled');
                              //       }
                              //
                              //       permission = await Geolocator
                              //           .checkPermission();
                              //       if (permission ==
                              //           LocationPermission.denied) {
                              //         permission = await Geolocator
                              //             .requestPermission();
                              //         if (permission ==
                              //             LocationPermission.denied) {
                              //           return Future.error(
                              //               'Location permissions are denied');
                              //         }
                              //       }
                              //
                              //       if (permission ==
                              //           LocationPermission
                              //               .deniedForever) {
                              //         return Future.error(
                              //             'Location permissions are permanently denied, we cannot request permissions.');
                              //       }
                              //
                              //       Position position = await Geolocator
                              //           .getCurrentPosition(
                              //           desiredAccuracy:
                              //           LocationAccuracy.high);
                              //       List<Placemark> placemarks =
                              //       await placemarkFromCoordinates(
                              //           position.latitude,
                              //           position.longitude);
                              //       if (placemarks.isNotEmpty) {
                              //         Placemark placemark =
                              //             placemarks.first;
                              //         String formattedAddress =
                              //             '${placemark.thoroughfare}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
                              //         address = formattedAddress;
                              //       }
                              //
                              //       ScaffoldMessenger.of(context)
                              //           .showSnackBar(SnackBar(
                              //           content: Text(
                              //               'Location getted successfuly : $address')));
                              //       Map<String, dynamic> obj =
                              //       listOfController[index];
                              //       obj['currentLocationtwo'] = address;
                              //       listOfController[index] = obj;
                              //     },
                              //     child: Card(
                              //       child: Center(
                              //           child:
                              //           Text('Current location')),
                              //     )),


                              InkWell(
                                onTap: () {
                                  uploadImageAndLocationToendRoad();
                                },
                                child:isloadingone
                                    ? Center(
                                    child:
                                    CircularProgressIndicator())
                                    : Card(
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(Icons.camera_alt),
                                          Text('Upload Image')
                                        ])),
                              ),
                              Text('Road Condition Assessment'),
                            ],
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
              ]),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: AppColors.freshgreen,
                heroTag: '1',
                onPressed: () {
                  RestorableTextEditingController commentsController = RestorableTextEditingController();
                  RestorableTextEditingController remarksController = RestorableTextEditingController();
                  RestorableTextEditingController lenghtController = RestorableTextEditingController();
                  currentIndex++;
                  var map = {
                    'currentLocation': '',
                    // 'useMap':'',
                    // 'uploadImage':'',
                    'comments': commentsController.value,
                    'remarks': remarksController.value,
                    'lenght': lenghtController.value,
                    'selectCondition': '',

                    ///this is the road condition
                    'roadConditionAssessment': '',
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
                onPressed: () async {
                  if (keyy.currentState!.validate()) {
                    if (DataModal.type_of_Carriagway == 'Single Carriageway') {
                      DataModal.no_of_lanes = noOfLanesController.value.text;
                      DataModal.width_of_lanes = widthofController.value.text;
                      DataModal.total_road_width = totalroadController.value.text;
                      DataModal.listofConrolller = listOfController;
                      DataModal.no_of_lanes = noOfLanesController.value.text;
                      DataModal.width_of_lanes = widthofController.value.text;
                      DataModal.total_road_width = totalroadController.value.text;
                      DataModal.listofConrolller = listOfController;
                      await DataModal.uploadList();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RoadFurniture_Screen(),
                      ));
                    } else {
                      DataModal.no_of_lanes = noOfLanesController.value.text;
                      DataModal.width_of_lanes = widthofController.value.text;
                      DataModal.total_road_width = totalroadController.value.text;
                      DataModal.listofConrolller = listOfController;
                      DataModal.no_of_lanes = noOfLanesController.value.text;
                      DataModal.width_of_lanes = widthofController.value.text;
                      DataModal.total_road_width = totalroadController.value.text;
                      DataModal.listofConrolller = listOfController;
                      await DataModal.uploadList();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DualCariageTypeScreen(),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all the fields ')));
                  }
                },
                child: Text('Next'),
              ),
            ],
          )),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => 'Road_Dimension';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
   registerForRestoration(noOfLanesController, 'no_of_lane');
   registerForRestoration(widthofController, 'width_of_Controller');
   registerForRestoration(totalroadController, 'total_road');
   registerForRestoration(commentsController, 'comments');
   registerForRestoration(remarksController, 'remarks');
   registerForRestoration(lenghtController, 'lenght');
  }
}

class MyDropdownButtonn extends StatefulWidget {
  MyDropdownButtonn(
      {required this.dropdownItems,
      required this.height,
      required this.onChanged});

  Function(String? value, int? index)? onChanged;
  double height;

  int? index;
  List dropdownItems;

  @override
  _MyDropdownButtonnState createState() =>
      _MyDropdownButtonnState(dropdownItems: dropdownItems);
}

//['ALLIGATOR CRACKINGS','BLOCK CRACKING','FATIGUE CRACKS','POTHOLES','BLOWOUTS','RUTTING','SINKHOLE','RAVELLING','SHOVING','UPHEAVAL','PEELING','NO MAJOR FAILURE','UNDER CONSTRUCTION','RIGID PAVEMENT','UNPAVED ROAD'];
class _MyDropdownButtonnState extends State<MyDropdownButtonn> {
  _MyDropdownButtonnState({required this.dropdownItems});

  String? _selectedItem;

  List dropdownItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.freshgreen,
      child: Center(
        child: DropdownButton<String>(
          hint: Text(
            'Select',
            style: TextStyle(color: Colors.white),
          ),
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          menuMaxHeight: widget.height * 0.3,
          dropdownColor: AppColors.freshgreen,
          style: TextStyle(color: Colors.white),
          value: _selectedItem,
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
