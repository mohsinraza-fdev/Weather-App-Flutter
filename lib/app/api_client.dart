import 'package:dio/dio.dart';

class ApiClient {
  static final _service = Dio();

  static Future<Map<String, dynamic>> get(String url) async {
    Response responce = await _service.get(url);
    return responce.data;
  }
}
