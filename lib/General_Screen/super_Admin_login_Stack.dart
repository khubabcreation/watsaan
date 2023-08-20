import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mam_sana_afzal/General_Screen/superAdminloginepage.dart';
import 'package:mam_sana_afzal/General_Screen/super_admin_login_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../Custome_Widget/check_Connectivity.dart';
import '../bloc/signin_bloc/sign_in_bloc.dart';
import 'SuperAdminHomeScreen.dart';


class SuperAdminLoginScreen extends StatelessWidget {
  static const String pageName = '/superAminLoginScreen';

  const SuperAdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckConnectivity(
      child: SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                SuperAdminLoginUI(),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                    );
                  } else if (state is SignInLoadedState) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{
                      // SharedPreferences pref = await SharedPreferences.getInstance();
                      // pref.setBool('loginsuper', true);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperAdminHomeScreen(),));
                    });
                    return SizedBox();
                  } else if (state is SignInFailedState) {
                    Provider.of<SignInBloc>(context, listen: false)
                        .add(SignInInitialEvent());
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    });
                    return SizedBox();
                  } else {
                    return SizedBox();
                  }
                })
              ],
            )),
      ),
    );
  }
}
