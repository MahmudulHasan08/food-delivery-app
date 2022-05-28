import 'package:fooddeliver/data/api/api_client.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:get/get.dart';

// repo talk to the api client
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductlist() async {
    return apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}
