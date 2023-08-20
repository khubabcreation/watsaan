import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DataModal {
  static String name_of_person = '';
  static String phone_of_person = '';
  static String city = '';
  static String distric = '';
  static String department = '';
  static String date = '';
  static String imageId = '';
  static String currentloctiontwo = '';

  ///Genearal Road Details
  static String road_Name = '';
  static String type_of_Road = '';
  static String type_of_Carriagway = '';

  ///Road Condation Assessment
  static String no_of_lanes = '';
  static String width_of_lanes = '';
  static String total_road_width = '';
  static String current_location = '';
  static String usemap_location = '';
  static String upload_image = '';
  static String road_contion = '';
  static String comments = '';
  static String remarks = '';
  static String road_type = '';
  static String image_url = '';
  static String latitude = '';
  static String longitude = '';
  static String long  = '';
  static String lat = '';
  static String timestamp = '';
  static List<Map<String, dynamic>>? listofConrolller;

  ///Road Furniture Screen
  static String singal_availability = '';
  static String singal_condition = '';
  static String singal_number = '';
  static String singal_comments = '';
  static String roundAbout_availability = '';
  static String roundAbout_condition = '';
  static String roundAbout_number = '';
  static String roundAbout_comments = '';
  static String roadSide_availability = '';
  static String roadSide_condition = '';
  static String roadSide_number = '';
  static String roadSide_comments = '';
  static String signBoard_availability = '';
  static String signBoard_condition = '';
  static String signBoard_number = '';
  static String signBoard_comments = '';
  static String kerb_availability = '';
  static String kerb_condition = '';
  static String kerb_number = '';
  static String kerb_comments = '';

  static String catEyes_availability = '';
  static String catEyes_condition = '';
  static String catEyes_number = '';
  static String catEyes_comments = '';

  static String divider_availability = '';
  static String divider_condition = '';
  static String divider_number = '';
  static String divider_comments = '';

  static String markation_availability = '';
  static String markation_condition = '';
  static String markation_number = '';
  static String markation_comments = '';

  static String roadShoulder_availability = '';
  static String roadShoulder_condition = '';
  static String roadShoulder_number = '';
  static String roadShoulder_comments = '';

  static String roadSideBusShader_availability = '';
  static String roadSideBusShader_condition = '';
  static String roadSideBusShader_number = '';
  static String roadSideBusShader_comments = '';

  static String roadSideBusbench_availability = '';
  static String roadSideBusbench_condition = '';
  static String roadSideBusbench_number = '';
  static String roadSideBusbench_comments = '';

  static String encroachment_availability = '';
  static String encroachment_condition = '';
  static String encroachment_number = '';
  static String encroachment_comments = '';

  static String greenbelt_availability = '';
  static String greenbelt_condition = '';
  static String greenbelt_number = '';
  static String greenbelt_comments = '';

  static String footpath_availability = '';
  static String footpath_condition = '';
  static String footpath_number = '';
  static String footpath_comments = '';

///////////////////
  static String streetlight_availability = '';
  static String streetlight_condition = '';
  static String streetlight_number = '';
  static String streetlight_comments = '';
  static String furnitureCondition = '';
  static String lastComments = '';
  static String draft = '';

  ///
  WriteBatch batch = FirebaseFirestore.instance.batch();

  ///here is my model classs is complete with all variables
  static uploadList() async {
    final dbref_assessment =
        await FirebaseFirestore.instance.collection('assessment');

    late TextEditingController commentsController;
    late TextEditingController remarksController;
    var roadCondition;
    var roadConditionAssessment;
   // String currentlocation_map = '';
    List data = [];

    ///i wrote the name of variable with _map becasue uper wla or necha wala same ho rha tha ese lia
    listofConrolller!.forEach((e) {
     // commentsController = e['comments'];
      remarksController = e['remarks'].value;
      roadCondition = e['selectCondition']; //// road Condition
      roadConditionAssessment = e['roadConditionAssessment'];
      // currentlocation_map = e['currentLocation'];
      // currentloctiontwo = e['currentLocationtwo'];
      // useMap_map = e['useMap'];
      // uploadImage_map = e['uploadImage'];
    });

    data.add({
      'no_of_lane': no_of_lanes,
      'no_of_width': width_of_lanes,
      'total_road_width': total_road_width,
     // 'comments': commentsController.text,
      'remarks': remarksController.text,
      'roadCondition': roadCondition,

      ///this is the condition which is selected by the user
      'roadConditionAssesment': roadConditionAssessment,
   //   'currentLocation': currentlocation_map,
      'image_url': image_url,
      'latitude': latitude,
      'longitude': longitude,
      //'timestamp': timestamp,
      'typeOfCarriage': type_of_Carriagway,
      // 'road_Name': road_Name,
      // 'draft': draft,
    });

    for (var dat in data) {
      final WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference<Map<String, dynamic>> newDocRef =
          dbref_assessment.doc();
      batch.set(newDocRef, dat, SetOptions(merge: true));
      await batch.commit().then((_) {
        print('list has been uploaded');
      }).catchError((error) {
        print('Error pushing list of data to Firestore: $error');
      });
    }
  }

  ///second fucntion *************************************************
  static uploadDataFurniture() async {
    final dbref_road_furniture =
        await FirebaseFirestore.instance.collection('road_furniture');
    List datafurniture = [];
    datafurniture.add({
      'singal_availability': singal_availability,
      'singal_condition': singal_condition,
      'singal_number': singal_number,
      'singal_comments': singal_comments,
      'roundAbout_availability': roundAbout_availability,
      'roundAbout_condition': roundAbout_condition,
      'roundAbout_number': roundAbout_number,
      'roundAbout_comments': roundAbout_comments,
      'roadSide_availability': roadSide_availability,
      'roadSide_condition': roadSide_condition,
      'roadSide_number': roadSide_number,
      'roadSide_comments': roadSide_comments,
      'signBoard_availability': signBoard_availability,
      'signBoard_condition': signBoard_condition,
      'signBoard_number': signBoard_number,
      'signBoard_comments': signBoard_comments,
      'kerb_availability': kerb_availability,
      'kerb_condition': kerb_condition,
      'kerb_number': kerb_number,
      'kerb_comments': kerb_comments,
      'catEyes_availability': catEyes_availability,
      'catEyes_condition': catEyes_condition,
      'catEyes_number': catEyes_number,
      'catEyes_comments': catEyes_comments,
      'divider_availability': divider_availability,
      'divider_condition': divider_condition,
      'divider_number': divider_number,
      'divider_comments': divider_comments,
      'markation_availability': markation_availability,
      'markation_condition': markation_condition,
      'markation_number': markation_number,
      'markation_comments': markation_comments,
      'roadShoulder_availability': roadShoulder_availability,
      'roadShoulder_condition': roadShoulder_condition,
      'roadShoulder_number': roadShoulder_number,
      'roadShoulder_comments': roadShoulder_comments,
      'roadSideBusShader_availability': roadSideBusShader_availability,
      'roadSideBusShader_condition': roadSideBusShader_condition,
      'roadSideBusShader_number': roadSideBusShader_number,
      'roadSideBusShader_comments': roadSideBusShader_comments,
      'roadSideBusbench_availability': roadSideBusbench_availability,
      'roadSideBusbench_condition': roadSideBusbench_condition,
      'roadSideBusbench_number': roadSideBusbench_number,
      'roadSideBusbench_comments': roadSideBusbench_comments,
      'encroachment_availability': encroachment_availability,
      'encroachment_condition': encroachment_condition,
      'encroachment_number': encroachment_number,
      'encroachment_comments': encroachment_comments,
      'greenbelt_availability': greenbelt_availability,
      'greenbelt_condition': greenbelt_condition,
      'greenbelt_number': greenbelt_number,
      'greenbelt_comments': greenbelt_comments,
      'footpath_availability': footpath_availability,
      'footpath_condition': footpath_condition,
      'footpath_number': footpath_number,
      'footpath_comments': footpath_comments,
      'streetlight_availability': streetlight_availability,
      'streetlight_condition': streetlight_condition,
      'streetlight_number': streetlight_number,
      'streetlight_comments': streetlight_comments,
      'furnitureCondition': furnitureCondition,
      'lastComments': lastComments,
      'typeOfCarriage': type_of_Carriagway,
      'road_Name': road_Name,
      'draft': draft,
    });
    for (var dat in datafurniture) {
      final WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference<Map<String, dynamic>> newDocRef =
          dbref_road_furniture.doc();
      batch.set(newDocRef, dat, SetOptions(merge: true));
      await batch.commit().then((_) {
        print('list has been uploaded');
      }).catchError((error) {
        print('Error pushing list of data to Firestore: $error');
      });
    }
  }

  /// upload name and contact of the person
  static uploadContactInfomation() async {
    List contactInformation = [];
    final dbref_ContactInformation =
        await FirebaseFirestore.instance.collection('contactInfo');
    contactInformation.add({
      'name': name_of_person,
      'phone': phone_of_person,
      'city': city,
      'distric': distric,
      'concernedDepartment': department,
      'date':date,
      // 'typeOfCarriage': type_of_Carriagway,
      // 'road_Name': road_Name,
      // 'draft': draft,
    });
    for (var dat in contactInformation) {
      final WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference<Map<String, dynamic>> newDocRef =
          dbref_ContactInformation.doc();
      batch.set(newDocRef, dat, SetOptions(merge: true));
      await batch.commit().then((_) {
        print('list has been uploaded');
      }).catchError((error) {
        print('Error pushing list of data to Firestore: $error');
      });
    }
  }

  /// this is the method of general road details
  static generalRoadDetails() async {
    List generalRoadDetails = [];
    final dbref_ContactInformation =
        await FirebaseFirestore.instance.collection('generalRoadDetails');
    generalRoadDetails.add({
      'roadName': road_Name,
      'typeOfRoad': type_of_Road,
      'typeOfCarriage': type_of_Carriagway,

    });
    for (var dat in generalRoadDetails) {
      final WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference<Map<String, dynamic>> newDocRef =
          dbref_ContactInformation.doc();
      batch.set(newDocRef, dat, SetOptions(merge: true));
      await batch.commit().then((_) {
        print('list has been uploaded');
      }).catchError((error) {
        print('Error pushing list of data to Firestore: $error');
      });
    }
  }

  static storedataAsDraft() async {
    final dbref_draft = await FirebaseFirestore.instance.collection('draft');
    String draft_id  = dbref_draft.doc().id;
     var mydate = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String getdate =   formatter.format(mydate);

    late TextEditingController commentsController;
    late TextEditingController remarksController;
    var roadCondition;
    var roadConditionAssessment;
 //   String currentlocation_map = '';

    listofConrolller!.forEach((e) {
      commentsController = e['comments'];
      remarksController = e['remarks'];
      roadCondition = e['selectCondition']; //// road Condition
      roadConditionAssessment = e['roadConditionAssessment'];
    //  currentlocation_map = e['currentLocation'];
      // useMap_map = e['useMap'];
      // uploadImage_map = e['uploadImage'];
    });
    dbref_draft.doc(draft_id).set({
      'id':draft_id,
      'no_of_lane': no_of_lanes,
      'no_of_width': width_of_lanes,
      'total_road_width': total_road_width,
      'comments': commentsController.text,
      'remarks': remarksController.text,
      'roadCondition': roadCondition,
        'time':timestamp,
      ///this is the condition which is selected by the user
      'roadConditionAssesment': roadConditionAssessment,
    //  'currentLocation': currentlocation_map,
      'image_url': image_url,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
      'typeOfCarriage': type_of_Carriagway,
      'road_Name': road_Name,
      'draft': draft,

      ///
      'singal_availability': singal_availability,
      'singal_condition': singal_condition,
      'singal_number': singal_number,
      'singal_comments': singal_comments,
      'roundAbout_availability': roundAbout_availability,
      'roundAbout_condition': roundAbout_condition,
      'roundAbout_number': roundAbout_number,
      'roundAbout_comments': roundAbout_comments,
      'roadSide_availability': roadSide_availability,
      'roadSide_condition': roadSide_condition,
      'roadSide_number': roadSide_number,
      'roadSide_comments': roadSide_comments,
      'signBoard_availability': signBoard_availability,
      'signBoard_condition': signBoard_condition,
      'signBoard_number': signBoard_number,
      'signBoard_comments': signBoard_comments,
      'kerb_availability': kerb_availability,
      'kerb_condition': kerb_condition,
      'kerb_number': kerb_number,
      'kerb_comments': kerb_comments,
      'catEyes_availability': catEyes_availability,
      'catEyes_condition': catEyes_condition,
      'catEyes_number': catEyes_number,
      'catEyes_comments': catEyes_comments,
      'divider_availability': divider_availability,
      'divider_condition': divider_condition,
      'divider_number': divider_number,
      'divider_comments': divider_comments,
      'markation_availability': markation_availability,
      'markation_condition': markation_condition,
      'markation_number': markation_number,
      'markation_comments': markation_comments,
      'roadShoulder_availability': roadShoulder_availability,
      'roadShoulder_condition': roadShoulder_condition,
      'roadShoulder_number': roadShoulder_number,
      'roadShoulder_comments': roadShoulder_comments,
      'roadSideBusShader_availability': roadSideBusShader_availability,
      'roadSideBusShader_condition': roadSideBusShader_condition,
      'roadSideBusShader_number': roadSideBusShader_number,
      'roadSideBusShader_comments': roadSideBusShader_comments,
      'roadSideBusbench_availability': roadSideBusbench_availability,
      'roadSideBusbench_condition': roadSideBusbench_condition,
      'roadSideBusbench_number': roadSideBusbench_number,
      'roadSideBusbench_comments': roadSideBusbench_comments,
      'encroachment_availability': encroachment_availability,
      'encroachment_condition': encroachment_condition,
      'encroachment_number': encroachment_number,
      'encroachment_comments': encroachment_comments,
      'greenbelt_availability': greenbelt_availability,
      'greenbelt_condition': greenbelt_condition,
      'greenbelt_number': greenbelt_number,
      'greenbelt_comments': greenbelt_comments,
      'footpath_availability': footpath_availability,
      'footpath_condition': footpath_condition,
      'footpath_number': footpath_number,
      'footpath_comments': footpath_comments,
      'streetlight_availability': streetlight_availability,
      'streetlight_condition': streetlight_condition,
      'streetlight_number': streetlight_number,
      'streetlight_comments': streetlight_comments,
      'furnitureCondition': furnitureCondition,
      'lastComments': lastComments,

      'name': name_of_person,
      'phone': phone_of_person,
      'city': city,
      'district': distric,
      'concernedDepartment': department,
      'date': getdate,
      'roadName': road_Name,
      'typeOfRoad': type_of_Road,
    });
  }
}
