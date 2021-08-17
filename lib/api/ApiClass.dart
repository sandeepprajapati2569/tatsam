// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'package:http/http.dart' as http;
// class ApiClass {
//   ApiClass();
//   static Future getApiCall(data, onSuccess, onError) {
//     final Map<String, String> defaultgetHeader = {
//       "Content-Type": "application/json",
//     };
//     print("url ${data["url"]}");
//     Map header = data.containsKey("header") ? data["header"] : defaultgetHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     print(header);
//     print("header $header");
//     http
//         .get(data["url"], headers: header)
//         .timeout(Duration(minutes: 2))
//         .then((http.Response response) {
//       print("statusCode ${response.statusCode}");
//       if (response.statusCode < 200 ||
//           response.statusCode >= 400 ||
//           response == null) {
//         onError(json.encode({"status": 0, "message": response.body}));
//       } else {
//         var data = json.decode(response.body);
//         onSuccess(response.body);
//       }
//     }).catchError((error) {
//       print("errror $error");
//       if (error is TimeoutException || error is SocketException) {
//         onError(json.encode({
//           "status": -1,
//           "message":
//           "We're having problems. Please check your internet connection."
//         }));
//         return;
//       }
//       onError({"status": 0, "message": error});
//     });
//   }
//   static getAsyncApiCall(data) async {
//     final Map<String, String> defaultHeader = {
//       "Content-Type": "application/json",
//     };
//     Map header = data.containsKey("header") ? data["header"] : defaultHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     print(header);
//     print("header $header");
//     try {
//       final response = await http.get(data["url"], headers: header);
// //      print(response);
//       return response == null ||
//           response.statusCode < 200 ||
//           response.statusCode >= 400
//           ?{"status":0,"response":json.decode(response.body)}
//           : {"status":1,"response":json.decode(response.body)};
//     }catch(error){
//       print(error);
//     }
//   }
//   static postAsyncApiCall(data) async {
//     var defaultHeader = {
//       "Content-Type": "application/json",
//     };
//     var header = data.containsKey("header") ? data["header"] : defaultHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     log("header ${json.encode(data)}");
//     try {
//       final response = await http.post(data["url"], headers: header, body: json.encode(data["data"] ?? {}));
//       print("Response : ${response.body}");
//       print(response.statusCode);
//       return response == null ||
//           response.statusCode < 200 ||
//           response.statusCode >= 400
//           ?{"status":0,"response":json.decode(response.body)}
//           : {"status":1,"response":json.decode(response.body)};
//     }catch(error){
//       print(error);
//       return {"status": 0, "response": "Something went wrong."};
//     }
//   }
//   static void postApiCall(apiData, onSuccess, onError) {
//     final Map<String, String> defaultHeader = {
//       "Content-Type": "application/json",
//     };
//     Map header = apiData.containsKey("header")
//         ? new Map<String, String>.from(apiData["header"])
//         : defaultHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     print("header $header");
// //    print("post data ${apiData["data"]}");
// //    print("post url ${apiData["url"]}");
// //    print("header $header");
//     http
//         .post(apiData["url"],
//         headers: header, body: json.encode(apiData["data"] ?? {}))
//         .timeout(Duration(minutes: 2))
//         .then((http.Response response) {
//       print("response ${response.statusCode}");
// //      print("response ${response.body}");
//       if (response.statusCode == 200) {
// //              var data = json.decode(response.body);
// //              data["status"]=="1" || data["status"] =="success"  ? onSuccess(response.body) : onError(response.body);
//         onSuccess(response.body);
//       } else {
//         onError(response.statusCode == 404
//             ? json.encode({"message": "url not found."})
//             : response.statusCode == 500
//             ? json.encode({"message": "Server error."})
//             : response.body);
//       }
//     })
//       ..catchError((error) {
//         print("errror $error");
//         if (error is TimeoutException || error is SocketException) {
//           onError(json.encode({
//             "status": -1,
//             "message":
//             "We're having problems. Please check your internet connection."
//           }));
//           return;
//         }
//         onError(json.encode({"status": 0, "message": "$error"}));
//       });
//   }
//   static void putApiCall(apiData, onSuccess, onError) {
//     final Map<String, String> defaultHeader = {
//       "Content-Type": "application/json",
//     };
//     Map header =
//     apiData.containsKey("header") ? apiData["header"] : defaultHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     print("post data ${apiData["data"]}");
//     print("header $header");
//     http
//         .put(apiData["url"],
//         headers: header, body: json.encode(apiData["data"] ?? {}))
//         .timeout(Duration(minutes: 2))
//         .then((http.Response response) {
//       print("response ${response.statusCode}");
//       print("response ${response.body}");
//       if (response.statusCode == 200) {
// //              var data = json.decode(response.body);
// //              data["status"]=="1" || data["status"]=="success"? onSuccess(response.body) : onError(response.body);
//         onSuccess(response.body);
//       } else {
//         onError({
//           response.statusCode == 404
//               ? json.encode({"message": "url not found."})
//               : response.statusCode == 500
//               ? json.encode({"message": "Server error."})
//               : response.body
//         });
//       }
//     })
//       ..catchError((error) {
//         print("errror $error");
//         if (error is TimeoutException || error is SocketException) {
//           onError({
//             "status": -1,
//             "message":
//             "We're having problems. Please check your internet connection."
//           });
//           return;
//         }
//         onError({"status": 0, "message": error});
//       });
//     ;
//   }
//   static void uploadImage(apiData, onSuccess, onError) async {
//     final Map<String, String> defaultHeader = {
//       "Content-Type": "application/json",
//     };
//     File file = apiData["image"];
//     Map header =
//     apiData.containsKey("header") ? apiData["header"] : defaultHeader;
//     header.putIfAbsent("TRANSACTION-SOURCE", () => "mobile");
//     print("post data ${apiData["data"]}");
//     print("header $header");
//     var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
//     //var stream = new http.ByteStream(Stream.castFrom(file.openRead()));
//     var length = await file.length();
//     var uri = Uri.parse(apiData["url"]);
//     var request = new http.MultipartRequest("POST", uri);
//     var multipartFile = new http.MultipartFile('file', stream, length,
//         filename: basename(file.path));
//     //contentType: new MediaType('image', 'png'));
//     request.files.add(multipartFile);
//     var response = await request.send();
//     print(response.statusCode);
// //    response.stream.transform(utf8.decoder).listen((value) {
// //      print(value);
// //    });
//     //Get the response from the server
//     var responseData = await response.stream.toBytes();
//     var responseString = String.fromCharCodes(responseData);
//     print(responseString);
//     try {
//       if (response.statusCode == 200) {
//         var data = json.decode((responseString));
//         print("data");
//         print(data);
//         data["status"] == 1 || data["status"] == "success"
//             ? onSuccess(responseString)
//             : onError(responseString);
//       } else {
//         onError({
//           response.statusCode == 404
//               ? json.encode({"message": "url not found."})
//               : response.statusCode == 500
//               ? json.encode({"message": "Server error."})
//               : responseString
//         });
//       }
//     } catch (e) {
//       print(e);
//       onError(json.encode({"message": "Server error."}));
//     }
//   }
// }