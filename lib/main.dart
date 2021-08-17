import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/handlers/sentry_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'helper/Session.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Session().init(await SharedPreferences.getInstance());
  // await DotEnv().load('environments/.env');

  /// To initialize other plugin
  Future initOtherPlugins() async {
    WidgetsFlutterBinding.ensureInitialized();
    Session().init(await SharedPreferences.getInstance());
  }

  /// Return myApp instance and initialize other plugin require in app.
  myApp() {
    initOtherPlugins();
    return MyApp();
  }

  CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [
    ConsoleHandler(
        enableApplicationParameters: true,
        enableDeviceParameters: true,
        enableCustomParameters: true,
        enableStackTrace: true),
    // CustomToastHandler(),
  ]);

  Catcher(myApp(),
      debugConfig: debugOptions,
      releaseConfig: debugOptions,
      ensureInitialized: true);

  // runApp(MyApp());
}
