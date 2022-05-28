import 'package:fooddeliver/data/api/api_client.dart';
import 'package:fooddeliver/utils/app_constants.dart';
import 'package:get/get.dart';

// repo talk to the api client
class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductlist() async {
    return apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
