import 'package:http/http.dart' as http;
import '../Model/model.dart';
import '../resource/constant.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<OrderListModel>?> fetchOrders() async {
    var headers = {
      'Accept':'application/json',
      'access-token': '$accessToken',
    };
    var response = await http.get(Uri.parse(apiOrderUrl), headers: headers);

    if (response != null && response.statusCode == 200) {
      var jsonString = response.body;
      print("response${response.body}");
      return orderListModelFromJson(jsonString);
    } else {
      print('Failed to fetch images: ${response?.statusCode}');
      // Show an error message or handle it accordingly
      return null;
    }
  }
}