import 'package:http/http.dart' as http;
import '../Model/model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<PhotoModel>?> fetchImages() async {
      String accessKey = "8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas";
      String apiUrl = "https://api.unsplash.com/photos/";
      var headers = {
        'Authorization': 'Client-ID $accessKey',
      };
      var response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
      var jsonString = response.body;
      return photoModelFromJson(jsonString);
      } else {
      //show error message
       return null;
    }
  }
}