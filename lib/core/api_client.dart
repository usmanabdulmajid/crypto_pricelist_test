import 'dart:io';

import 'package:crypto_pricelist_test/core/exceptions.dart';
import 'package:http/http.dart';

enum Method { get, post, put, patch, delete }

class ApiClient {
  final Client client;
  ApiClient(this.client);

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response response;
    try {
      if (method == Method.delete) {
        response = await client.delete(Uri.parse(url), body: params);
      } else if (method == Method.post) {
        response = await client.post(Uri.parse(url), body: params);
      } else if (method == Method.put) {
        response = await client.put(Uri.parse(url), body: params);
      } else if (method == Method.patch) {
        response = await client.patch(Uri.parse(url), body: params);
      } else {
        response = await client.get(Uri.parse(url));
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception('Error');
      }
    } on SocketException {
      throw NetworkException();
    } on FormatException {
      throw InvalidUriFormat();
    } catch (e) {
      throw Exception(e);
    }
  }
}
