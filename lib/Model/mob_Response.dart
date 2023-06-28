// To parse this JSON data, do
//
//     final mobResponse = mobResponseFromJson(jsonString);

import 'dart:convert';

List<Map<String, String?>> mobResponseFromJson(String str) => List<Map<String, String?>>.from(json.decode(str).map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v))));

String mobResponseToJson(List<Map<String, String?>> data) => json.encode(List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))));
