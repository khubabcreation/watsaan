import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mam_sana_afzal/Road/depricatedRoaddetauks.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Dimension_Screen.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Furniture_Screen.dart';

import 'NameContactScreen.dart';
import 'LoginScreen.dart';
import 'Road/RoadAssiament_Single.dart';
import 'RoadFrom/RoadDetailsScreen.dart';
import 'RoadFrom/RoadEvalutionScreen.dart';
import 'utils/StylishButton.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WATSAN',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
