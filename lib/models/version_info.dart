import 'package:package_info/package_info.dart';

/// platform : "android"
/// latest_version : "1.0.16"
/// mandatory_version : "1.0.15"
/// message : "update message"

class VersionInfo {
  String platform;
  String latestVersion;
  String mandatoryVersion;
  String message;

  VersionInfo({
      this.platform, 
      this.latestVersion, 
      this.mandatoryVersion, 
      this.message});

  VersionInfo.fromJson(dynamic json) {
    platform = json["platform"]??"android";
    latestVersion = json["latest_version"];
    mandatoryVersion = json["mandatory_version"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["platform"] = platform;
    map["latest_version"] = latestVersion;
    map["mandatory_version"] = mandatoryVersion;
    map["message"] = message;
    return map;
  }

  @override
  String toString() {
    return toJson().toString();
  }

}

Future<String> getAppCurrentVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;
  String currentAppVersion = "$version.$buildNumber";
  return currentAppVersion;
}