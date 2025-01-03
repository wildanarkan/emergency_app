import 'package:emergency_app/core/http/api_response.dart';
import 'package:emergency_app/core/type_deffs.dart';
import 'package:flutter/material.dart';

/// Response of [data] with type [Json].
/// constructor [cast] to cast [Json] -> [T].
/// returns [Null] if failed to cast
class JsonResponse<T> extends ApiResponse {
  /// function to convert body to JSON
  final T Function(Json json) cast;
  final Json Function()? source;
  late final T? data = castJson();

  JsonResponse(super.response, this.cast, {this.source});

  T? castJson() {
    try {
      return cast(source?.call() ?? rawData);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }
}
