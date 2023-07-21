import 'dart:convert';
import 'package:apitask/Model/firm_Request.dart';
import 'package:apitask/Model/firm_Response.dart';
import 'package:http/http.dart' as http;

import '../Api/Api_manager.dart';

class FirmListController {

  Future<List<FirmResponse>> fetchFirmList(
   FIrmRequest request
  ) async {
    final url = Uri.parse("${ApiManager.baseUrl}firm/get_all_firm_details");
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url, headers: headers, body: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
      final List<dynamic> firmList = jsonDecode(response.body);

      List<FirmResponse> firmObjects = firmList.map((x) => FirmResponse.fromJson(x)).toList();
      return firmObjects;
    } else {
      throw Exception('Failed to fetch firm list');
    }
  }
}