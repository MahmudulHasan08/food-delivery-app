import 'package:fooddeliver/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  //talk to the server from token
  late String token;
  //server ulr because app talk to the server
  final String appBaseUrl;
  // map is stroing data locally of converting data to map do as well
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      "Content-type": "application/json; carset=UTF-8",
      "Authorization": "Bearer $token"
    };
  }
  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
