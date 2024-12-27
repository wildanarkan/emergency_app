import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  final Future<Uri> _uri;
  final Map<String, String> _additionalHeaders;
  final http.Client Function() _httpClient;

  HttpClient(
    this._uri,
    this._additionalHeaders,
    this._httpClient,
  );

  Future<http.Response> post<T extends Object>([T? body]) async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.post(
        uri,
        headers: _additionalHeaders,
        body: jsonEncode(body),
      );
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> get<T extends Object>() async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.get(uri, headers: _additionalHeaders);
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> put<T>([T? body]) async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.put(
        uri,
        headers: _additionalHeaders,
        body: jsonEncode(body),
      );
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> patch<T extends Object>([T? body]) async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.patch(
        uri,
        headers: _additionalHeaders,
        body: jsonEncode(body),
      );
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> delete<T extends Object>([T? body]) async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.delete(
        uri,
        headers: _additionalHeaders,
        body: jsonEncode(body),
      );
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.StreamedResponse> postMultipart({
    Map<String, String> fields = const {},
    List<http.MultipartFile> files = const [],
  }) async {
    try {
      final uri = await _uri;
      final multipartRequest = http.MultipartRequest('POST', uri)
        ..headers.addAll(_additionalHeaders)
        ..headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data'
        ..fields.addAll(fields)
        ..files.addAll(files);

      final response = await multipartRequest.send();
      return response;
    } finally {}
  }

  Future<http.Response> postFormUrlEncoded<T extends Object>([T? body]) async {
    final client = _httpClient();
    try {
      final uri = await _uri;
      final response = await client.post(
        uri,
        headers: _additionalHeaders,
        body: body,
      );
      return response;
    } finally {
      client.close();
    }
  }
}
