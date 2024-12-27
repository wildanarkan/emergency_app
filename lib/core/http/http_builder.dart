import 'dart:async';

import 'package:emergency_app/core/http/http_client.dart';
import 'package:emergency_app/core/type_deffs.dart';
import 'package:http/http.dart' as http;

class HttpBuilder {
  final Map<String, String> defaultHeaders;
  final http.Client Function() coreClient;

  HttpBuilder({
    required this.defaultHeaders,
    required this.coreClient,
  });

  HttpClient _buildClient(
    Future<String> url,
    String path, [
    Json? query,
    Map<String, String>? headers,
  ]) {
    final finalHeaders = Map.of(defaultHeaders)..addAll(headers ?? {});
    final uri = Future.sync(() async {
      final urlSegments = await url.then((value) => value.split('/'));
      final pathSegments = path.split('/');

      final authority = urlSegments.first;
      final basePathSegments = urlSegments.sublist(1);
      final finalSegments = (basePathSegments + pathSegments)
        ..removeWhere((element) => element.isEmpty);

      final finalPath = finalSegments.join('/');
      final uri = Uri.https(authority, finalPath, query);
      return uri;
    });

    return HttpClient(uri, finalHeaders, coreClient);
  }

  HttpClient build({
    required String path,
    Json? query,
    Map<String, String>? headers,
  }) {
    final baseUrl = Future<String>.value('base-url.com');
    return _buildClient(baseUrl, path, query, headers);
  }
}
