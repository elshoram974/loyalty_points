import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';

import '../../../app_info.dart';
import '../constants/app_strings.dart';

void setUserToken(String? token) {
  g.Get.find<APIServices>().token = token;
}

class APIServices {
  APIServices(this._dio, this._storage) {
    _getAuthToken.then((value) => token = value);
  }
  final Dio _dio;
  final FlutterSecureStorage _storage;

  String? token;

  Map<String, dynamic> _header(String? token) {
    return {
      'content-type': "application/json",
      if (token != null) 'Authorization': "Bearer $token",
    };
  }

  Future<Map<String, dynamic>> post(
    final String link,
    final Object? body,
  ) async {
    token = await _getAuthToken;

    if (AppInfo.isDebugMode) {
      print("endpoint: $link, body: $body");
    }

    final Response response = await _dio.post(
      link,
      data: body,
      options: Options(headers: _header(token)),
    );

    if (response.data!['success'] == false) {
      throw response.data!['message'];
    }

    return response.data!;
  }

  Future<Map<String, dynamic>> postWithFile(
    final String link,
    final Map<String, dynamic>? body, {
    required final Map<String, List<XFile>> files,
  }) async {
    token = await _getAuthToken;
    final Map<String, dynamic> data = {};
    data.addAll(body ?? {});

    for (MapEntry<String, List<XFile>> e in files.entries) {
      final List<MultipartFile> multiFiles = await Future.wait(
        e.value.map((e) => MultipartFile.fromFile(e.path, filename: e.name)),
      );
      data[e.key] = multiFiles;
    }

    if (AppInfo.isDebugMode) {
      print("endpoint: $link, body: $body with ${files.entries.length} files");
    }

    final Response response = await _dio.post(
      link,
      data: FormData.fromMap(data),
      options: Options(headers: _header(token)),
    );

    if (AppInfo.isDebugMode) log("response ${jsonEncode(response.data)}");

    if (response.data!['success'] == false) {
      throw response.data!['message'];
    }

    return response.data!;
  }

  Future<Map<String, dynamic>> get(final String link) async {
    token = await _getAuthToken;

    if (AppInfo.isDebugMode) {
      print("api $link");
      print("user token is $token ");
    }

    final Response response = await _dio.get(
      link,
      options: Options(headers: _header(token)),
    );
    if (AppInfo.isDebugMode) log("response ${jsonEncode(response.data)}");

    if (response.data!['success'] == false) {
      throw response.data!['message'];
    }

    return response.data!; // ['data']; return all response data
  }

  Future<String?> get _getAuthToken => _storage.read(key: AppString.kTokenKey);
}
