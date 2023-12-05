import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UtilProvider extends ChangeNotifier {
  static final UtilProvider rtp = UtilProvider._();
  UtilProvider._();

  Future responseHTTP({required String urlBase}) async {
    var response = await http.get(Uri.parse(urlBase), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return response;
  }

  Future<http.Response> postHTTP(
      {required String url, required Map<String, dynamic> body}) async {
    var bodyjson = jsonEncode(body);
    return await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: bodyjson);
  }
}
