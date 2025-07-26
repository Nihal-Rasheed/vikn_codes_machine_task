 import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes/service/share_pref_service.dart';

 class HttpService {

   Future<Map<String, String>> _buildHeaders({String? token}) async {
     final headers = <String, String>{
       'Content-Type': 'application/json',
     };

     if (token!=null&& token.isNotEmpty) {
       headers['Authorization'] = 'Bearer $token';
     }

     return headers;
   }


   Future<http.Response> get(String url, {String? token}) async {
     final headers = await _buildHeaders(token: token);
     final uri = Uri.parse(url);
     return await http.get(uri, headers: headers);
   }


   Future<http.Response> post(String url, Map<String, dynamic> data, {String? token}) async {
     final headers = await _buildHeaders(token: token);
     final uri = Uri.parse(url);
     return await http.post(uri, headers: headers, body: jsonEncode(data));
   }
 }
