import 'package:connectivity/connectivity.dart';

abstract class ApiStateListener{
  void onSuccess(dynamic data);
  void onError(Object data);
  void onNoNetWork(ConnectivityResult result);
}