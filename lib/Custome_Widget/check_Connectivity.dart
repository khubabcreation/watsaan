import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/connectivity_bloc/connectivity_bloc.dart';
     ////

class CheckConnectivity extends StatelessWidget {
  final Widget child;

  const CheckConnectivity({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.blue,
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          if (state is ConnectedState) {
            return child;
          } else if (state is DisconnectedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('404 Fetel Error'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                        height: height*0.3,
                        width: width*0.7,
                        child: Card(
                          elevation: 40,
                          child: Image.asset("assets/signal.png"),
                        )),
                  ),
                  SizedBox(height: height*0.02,),
                  Text('Internet Lost ',style: TextStyle(fontFamily:'courgette',fontSize: 32),),
                  SizedBox(height: height*0.01,),
                  Text('You Have Fetal Error Please Check Your Internet Connectivity! '),
                  SizedBox(height: height*0.02,),
                  Text('404 Bad State',style: TextStyle(fontFamily:'courgette',fontSize: 32),),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
