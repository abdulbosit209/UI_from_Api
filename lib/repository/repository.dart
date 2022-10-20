import 'package:custom_ui/api/api_client.dart';
import 'package:custom_ui/models/input_model.dart';

class MyRepository {

  ApiClient apiClient = ApiClient();

  Future<List<InputModel>> getDynamicFields() async {
    return apiClient.getDynamicFields();
  }

}