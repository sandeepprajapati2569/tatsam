import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tatsam/helper/Session.dart';
import 'package:connectivity/connectivity.dart';
import 'package:tatsam/screens/home/ui/home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BuildContext context;
  var currentOpacity = 1.0;
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentOpacity = 0.0;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      isInternet();
    });
    super.initState();
  }

  Future isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => Session().isLogin() ? Home() : Home()));
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => Session().isLogin() ? Home() : Home()));
    } else {
      // Wifi detected but no internet connection found.
      showInternetError();
    }
  }

  void showInternetError() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "You're not connected to a Network",
            textAlign: TextAlign.center,
          ),
          content: FloatingActionButton(
            onPressed: () => exit(0),
            tooltip: 'Close app',
            child: new Icon(
              Icons.close,
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      body: Center(
          child: AnimatedOpacity(
        opacity: currentOpacity,
        duration: const Duration(seconds: 1),
        child: Text("tatsam",
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.w400,
              color: Colors.cyan,
            )),
      )),
    );
  }
}
