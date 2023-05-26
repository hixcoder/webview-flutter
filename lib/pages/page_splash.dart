///===========================================
/// @ Author       : HixCoder
/// @ Create Time  : 2022-06-05 12:09:16
/// @ Modified by  : HixCoder
/// @ Modified time: 2022-06-05 12:09:23
/// @ Github       : https://github.com/hixcoder
///===========================================

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_zouhir/pages/page_home.dart';
import 'package:webview_zouhir/widgets/progress_btn.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({super.key});

  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  bool visibility = true;
  String errorMessage = "لا يوجد اتصال بالإنترنت";

  // for check connection
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // function for go home
  void goHome() {
    print("================> ${_connectionStatus.toString()}");

    Future.delayed(Duration(seconds: 3), () {
      if (_connectionStatus == ConnectivityResult.none) {
        visibility = false;
        setState(() {});
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PageHome();
        }));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // for check connection
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    goHome();
    print("================> ${_connectionStatus.toString()}");
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print("================connectivity error");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(80),
            color: Colors.black,
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),

        // this is the Button
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ProgressBtn(
            isVisible: visibility,
            onPressed: () {
              setState(() {
                visibility = true;
              });
              goHome();
            },
            errorMessage: errorMessage,
          ),
        ),
      ],
    );
  }
}
