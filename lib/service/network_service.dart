import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkService {
  static var logger = Logger();

  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> header = {};

  /// APIs
  static String API_GET_ONE = "/api/v1/employee/"; // add id ;
  static String API_GET_ALL = "/api/v1/employees";
  static String API_POST = "/api/v1/create";
  static String API_PUT = "/api/v1/update/"; // add id
  static String API_DELETE = "/api/v1/delete/"; // add id

  /// request methods

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response =
        await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response = await put(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response = await delete(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, dynamic> paramsEmpty() {
    Map<String, dynamic> map = {};
    return map;
  }

// static List<NewsModel> parsingResponse({required String response}) {
//   dynamic json = jsonDecode(response);
//   var data =
//   List<NewsModel>.from(json.map((mp) => NewsModel.fromMap(map: mp)));
//   return data;
// }
}
