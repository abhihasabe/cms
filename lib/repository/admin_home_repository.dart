import 'package:cms/network/api_calls.dart';
import 'package:cms/theme/app_network_constants.dart';

class AdminHomeRepository{
  dynamic resp;

  Future fetchCountData(token) async {
    resp = APIManager.getAPICall(COUNT_URL, token);
    return resp;
  }
}