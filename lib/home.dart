import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebView(
              gestureNavigationEnabled: false,
              initialUrl: "http://eastsussexboilers.co.uk",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                setState(() {
                  isLoaded = true;
                });
              },
            ),
            isLoaded
                ? SizedBox()
                : Center(
                    child: Platform.isIOS
                        ? CupertinoActivityIndicator()
                        : SpinKitCubeGrid(
                            color: ThemeData.dark().accentColor,
                            duration: Duration(seconds: 1),
                          ),
                  )
          ],
        ),
      ),
    );
  }
}
