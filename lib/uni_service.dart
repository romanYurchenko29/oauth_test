import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oauth_test/nav_service.dart';
import 'package:uni_links/uni_links.dart';

class UniService {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log("Failed to get code yoopta");
    } on FormatException {
      log("Wrong format yoopta");
    }

    uriLinkStream.listen(
      (Uri? uri) {
        uniHandler(uri);
      },
      onError: (e) {
        log("Error message: $e");
      },
    );
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> params = uri.queryParameters;

    String accessCode = params["code"] ?? "";

    print(accessCode);

    Navigator.pushNamed(NavService.context!, "/access", arguments: accessCode);
  }
}
