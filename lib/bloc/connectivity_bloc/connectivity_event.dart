import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_bloc.dart';



abstract class ConnectivityEvent {}

class ConnectedEvent extends ConnectivityEvent {
  ConnectivityResult result;
  ConnectedEvent(this.result);
}

class DisConnectedEvent extends ConnectivityEvent {
  ConnectivityResult result;
  DisConnectedEvent(this.result);
}
