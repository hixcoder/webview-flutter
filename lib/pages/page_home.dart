///===========================================
/// @ Author       : HixCoder
/// @ Create Time  : 2022-06-05 12:09:16
/// @ Modified by  : HixCoder
/// @ Modified time: 2022-06-05 12:09:23
/// @ Github       : https://github.com/hixcoder
///===========================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageHome extends StatefulWidget {
  const PageHome({
    Key? key,
  }) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // function for give initialize the progress bar status
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (false),
      child: Scaffold(
        body: Container(
          margin:
              EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
          child: const WebView(
            initialUrl: "https://amlakiweb.com/home",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
