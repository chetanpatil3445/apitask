import 'dart:convert';
import 'package:http/http.dart' as http;

class FirmListController {
  final String baseUrl = "https://mapi.omunim.in/";

  Future<List<Map<String, dynamic>>> fetchFirmList({
    required String apiRequestType,
    required String ecomOwnId,
    required String ecomLoginId,
    required String systemOnOff,
    required String gbDbHost,
    required String userLoginId,
    required String ecomDomainName,
    required String ecomApiKey,
    required String apiLoginToken,
    required String apiProdKey,
    required String apiRequestId,
    required String apiFolder,
    required String mapiFolder,
    required String remoteLogin,
    required String gbDbPort,
    required String gbDbUser,
    required String userDbHost,
    required String userDbPort,
    required String userDbUser,
    required String ownerLoginId,
    required String ownerUserPassword,
  }) async {
    final url = Uri.parse(baseUrl + "firm/get_all_firm_details");
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "api_request_type": apiRequestType,
      "ecom_own_id": ecomOwnId,
      "ecom_login_id": ecomLoginId,
      "system_onoff": systemOnOff,
      "GB_DB_HOST": gbDbHost,
      "user_login_id": userLoginId,
      "ecom_domain_name": ecomDomainName,
      "ecom_api_key": ecomApiKey,
      "api_login_token": apiLoginToken,
      "api_prod_key": apiProdKey,
      "api_request_id": apiRequestId,
      "api_folder": apiFolder,
      "mapi_folder": mapiFolder,
      "remote_login": remoteLogin,
      "GB_DB_PORT": gbDbPort,
      "GB_DB_USER": gbDbUser,
      "USER_DB_HOST": userDbHost,
      "USER_DB_PORT": userDbPort,
      "USER_DB_USER": userDbUser,
      "owner_login_id": ownerLoginId,
      "owner_user_password": ownerUserPassword,
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final List<dynamic> firmList = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(firmList.map((x) => Map<String, dynamic>.from(x)));
    } else {
      throw Exception('Failed to fetch firm list');
    }
  }
}
