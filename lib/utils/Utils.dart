import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';

class UnitUtils {
  static getNumberFormat({
    @required value,
    customPattern = '#,##,##,###.#',
  }) {
    return NumberFormat.currency(locale: "en", customPattern: customPattern)
        .format(value);
  }

  // static void launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     print('Could not launch $url');
  //   }
  // }

  /*EMAIL VALIDATOR*/
  static bool isValidEmail(String emailText) {
    if (emailText == null || emailText.length < 1) return false;
    print(emailText);
    Pattern pattern = r"^([a-zA-Z0-9_\-\.\,]+)@([a-zA-Z]{4,})\.([a-zA-Z]{2,})$";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(emailText);
  }

  /*ZIP VALIDATOR*/
  static bool isValidZip(String zipText) {
    Pattern pattern = r'^[0-9]{5}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(zipText);
  }

  /*Phone VALIDATOR*/
  static bool isValidPhone(String phone) {
    print("$phone ${phone.length}");

    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(phone);
  }

  /*Get Phone Number*/
  static String getPhoneNumber(String phoneString) {
    if (phoneString == null || phoneString.length < 10) return "";
    phoneString = phoneString.replaceAll(new RegExp(r'[^0-9]'), '');
    if (phoneString.length > 10) {
      phoneString = phoneString.substring(phoneString.length - 10);
    }
    return phoneString;
  }

  //
  //// the current time, in “seconds since the epoch”
  static int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  static String getTimeSince(double elepsedSeconds) {
    double currentSecs =
        currentTimeInSeconds as double; // /*+ gmtOffset / 1000*/;

    double diffSecs = currentSecs - elepsedSeconds;

    double diffInMinute = (diffSecs / 60);

    double diffInHour = (diffInMinute / 60);

    double secsInDay = (diffInHour / 24);

    double secsInMonth = (secsInDay / 30);

    var secsInYear = (secsInMonth / 12);

    String sinceStr = "";

//    if ((secsInYear) > 0) {
//      sinceStr = String.format("%d years ago ", (TimeUnit.SECONDS.toDays(diffSecs) / 365));//(int) (diffSecs % miliInYear) + " years ago";
//    } else if ((secsInMonth) > 0) {
//      sinceStr = String.format("%d months ago ", (TimeUnit.SECONDS.toDays(diffSecs) / 30));
//    } else if ((secsInDay) > 0) {
//      sinceStr = String.format("%d days ago ", (TimeUnit.SECONDS.toDays(diffSecs)));
//    } else if ((diffInHour) > 0) {
//      sinceStr = String.format("%d hours ago ", (TimeUnit.SECONDS.toHours(diffSecs)));
//    } else if ((diffInMinute) > 0) {
//      sinceStr = String.format("%d minutes ago ", (TimeUnit.SECONDS.toMinutes(diffSecs)));
//    } else {
//      sinceStr = String.format("%d seconds ago ", (TimeUnit.SECONDS.toSeconds(diffSecs)) < 0 ? 1 : (TimeUnit.SECONDS.toSeconds(diffSecs)));
//    }

    return sinceStr;
  }

  static String getDifference(DateTime bigDate, DateTime smallDate) {
    double diffSecs = bigDate.millisecondsSinceEpoch / 1000 -
        smallDate.millisecondsSinceEpoch / 1000;

    int days = (diffSecs / (24 * 60 * 60)).floor();

    if (days > 0) {
      diffSecs = diffSecs - days * (24 * 60 * 60);
    }
    int diffInHour = (diffSecs / (60 * 60)).floor();

    if (diffInHour > 0) {
      diffSecs = diffSecs - diffInHour * (60 * 60);
    }
    int diffInMinute = (diffSecs / 60).floor();

    String sinceStr = "";

    if ((days) > 0) {
      sinceStr += sprintf("%dd", ["$days"]);
    }
    if ((diffInHour) > 0) {
      sinceStr += sprintf(" %dh", ["$diffInHour"]);
    }
    if (diffInMinute > 0) {
      sinceStr += sprintf(" %dm", ["$diffInMinute"]);
    }

    return sinceStr;
  }

  static String getTime(time, {format: "hh:mm a", date: "00000000"}) {
    if (time == null) return "";
    String dateString =
        date ?? new DateFormat("yyyyMMdd").format(new DateTime.now());
    DateTime dateTime = DateTime.parse('${dateString}T$time');
    format =
        format.toString().replaceAll("th", getDayOfMonthSuffix(dateTime.day));
    return new DateFormat(format).format(dateTime);
  }

  static String getCurrentDate({format: "dd'th' MMM yyyy"}) {
    return new DateFormat(format).format(new DateTime.now());
  }

  static String getDate(date, {format: "dd'th' MMM yyyy"}) {
    try {
      if (date == null) return "";
      DateTime dateTime = date is DateTime ? date : DateTime.parse(date);
      format =
          format.toString().replaceAll("th", getDayOfMonthSuffix(dateTime.day));
      return new DateFormat(format).format(dateTime);
    } catch (error) {
      print(error);
      return date;
    }
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String capsOfFirstChar(String input) {
    if (input == null || input.isEmpty) return input;
    if (input.length < 2) return input[0].toUpperCase();

    return '${(input[0].toUpperCase())}${input.substring(1).toLowerCase()}';
  }

  static String capsOfWord(String input) {
    if (input == null || input.isEmpty) return input;
    var splitStr = input.toLowerCase().split(' ');
    for (var i = 0; i < splitStr.length; i++) {
      // You do not need to check if i is larger than splitStr length, as your for does that for you
      // Assign it back to the array
      splitStr[i] = splitStr[i][0].toUpperCase() + splitStr[i].substring(1);
    }
    // Directly return the joined string
    return splitStr.join(' ');
  }

  static String sprintf(String template, List<Object> arguments) {
    String result = "";
    int argumentsIndex = 0;
    for (int index = 0; index < template.length; index++) {
      if (template.codeUnitAt(index) == 37 /* ascii '%' */) {
        index++;

        /// to ignore first char after %
        result += arguments[argumentsIndex++].toString();
      } else {
        result += template.substring(index, index + 1);
      }
    }
    return result;
  }

  static String getPlural(int number, String string) {
    if (number > 1)
      return "$number ${string}s";
    else
      return "$number ${string}";
  }

  static void share() {
    Share.share('check out my website https://example.com');
  }

  static void shareFile(String path) {
    Share.shareFiles([path], text: 'Great picture');
  }

  static bool isDomestic(String string) {
    List<String> splitString = string.split(",");
    if (splitString.length < 1) return false;
    List<String> citySplit = splitString[splitString.length - 1].split(" ");
    if (citySplit.length < 1) return false;
    bool isDomestic = false;
    for (int i = 0; i < citySplit.length; i++) {
      if (citySplit[i].toUpperCase() == "IN") {
        isDomestic = true;
        break;
      }
    }

    return isDomestic;
  }

  static bool isLCC(supplier) {
    print("supplier : $supplier");
    if (supplier == "SG" ||
        supplier == "6E" ||
        supplier == "G8" ||
        supplier == "G9" ||
        supplier == "2T" ||
        //AirAsia Check
        supplier == "I5" ||
        supplier == "AK" ||
        supplier == "QZ" ||
        supplier == "FD" ||
        supplier == "PQ" ||
        supplier == "Z2" ||
        supplier == "D7" ||
        supplier == "XJ" ||
        supplier == "XT" ||
        supplier == "DJ") {
      return true;
    } else {
      return false;
    }
  }

  static int stringToInt(number) => number == null
      ? 0
      : number is int
          ? number
          : (number is double ? number.floor() : int.parse(number));

  static bool isSuccess(int statusCode) {
    return statusCode == 200 || statusCode == 201 || statusCode == 202;
  }

  static deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    Map info = new Map();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      info["model"] = androidInfo.model;
      info["brand"] = androidInfo.brand;
      info['version'] = androidInfo.version.sdkInt;
      info["platform"] = "android";
      info['release_version'] = androidInfo.version.release;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      info["model"] = iosDeviceInfo.model;
      info["brand"] = iosDeviceInfo.name;
      info['release_version:'] = iosDeviceInfo.utsname.release;
      info["version:"] = iosDeviceInfo.utsname.version;
      info['platform'] = "ios";
    }
    return info;
  }
}
