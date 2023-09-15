import 'dart:developer';

import 'package:halen_customer_app/constants/strings.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  http.Client client = http.Client();

  Future<http.Response> get(Uri url) async {
    var response = await client.get(url, headers: {
      Strings.contentType: Strings.applicationJson,
    });
    log('${response.request}:${response.body}');
    return response;
  }

  Future<http.Response> post(Uri url, var bodyData) async {
    var response = await client.post(url, body: bodyData, headers: {
      Strings.contentType: Strings.applicationJson,
    });
    return response;
  }

  Future<http.Response> delete(Uri url, {var bodyData}) async {
    var response = await client.delete(url, body: bodyData, headers: {
      Strings.contentType: Strings.applicationJson,
    });
    return response;
  }

  Future<http.Response> put(Uri url, var bodyData) async {
    var response = await client.put(url, body: bodyData, headers: {
      Strings.contentType: Strings.applicationJson,
    });
    return response;
  }
}
