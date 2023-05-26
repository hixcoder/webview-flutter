import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// for check connection status
Future<bool> isConnected(BuildContext context) async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.wifi ||
      result == ConnectivityResult.mobile) {
    return true;
  } else {
    return false;
  }
}
