import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_media_ui/feature/home_screen/model/feed_data.dart';
import 'package:social_media_ui/utils/app_constants.dart';

class FeedRepo {

  Future<ProductList> getFeedData(int limit, int skip) async {
    try {
      final url = Uri.parse("${AppConstants.feedData}$limit&skip=$skip"); // Android Emulator ONLY

      print("====> Api Call : $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("Printing thw data $data");
        return ProductList.fromJson(data);
        //return data.map((item) => ProductList.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load employees: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

}