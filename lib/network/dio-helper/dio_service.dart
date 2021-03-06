import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    String baseUrl = 'https://team3-github-180daraga.herokuapp.com/';

    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> getDataa({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    print('done dio');
    return dio.post(url,data: data, queryParameters: query);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token',
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
