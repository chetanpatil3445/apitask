import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/firm_Request.dart';

class ApiManager {
  static const String baseUrl = "https://mapi.omunim.in/";

  Future<List<Map<String, String?>>> fetchFirmList(FirmListRequest request) async {
    final url = Uri.parse(baseUrl + "firm/get_all_firm_details");
    final headers = {'Content-Type': 'application/json'};
    final body = request.toJson();

    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final List<dynamic> firmList = jsonDecode(response.body);
      return List<Map<String, String?>>.from(firmList.map((x) => Map<String, String?>.from(x)));
    } else {
      throw Exception('Failed to fetch firm list');
    }
  }
}
