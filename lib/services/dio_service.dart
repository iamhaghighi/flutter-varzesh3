import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getRssMethod(String url) async {
    return dio.get(url);
  }
}
