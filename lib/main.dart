import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mam_sana_afzal/General_Screen/splash_Screen.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Dimension_Screen.dart';
import 'package:mam_sana_afzal/single_Carriage_Screen/Road_Furniture_Screen.dart';
import 'General_Screen/draftFormScreen.dart';
import 'General_Screen/draftScreen.dart';
import 'bloc/connectivity_bloc/connectivity_bloc.dart';
import 'bloc/password_field_bloc/password_field_bloc.dart';
import 'bloc/signin_bloc/sign_in_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider<PasswordFieldBloc>(
          create: (context) => PasswordFieldBloc(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
