import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class CommonData {
  static String createDeeplink({String screen = "home", String id = ""}) {
    Map map = {"screen": screen, "id": id};
    final bytes = utf8.encode(jsonEncode(map));
    final base64Url = base64Encode(bytes);
    debugPrint("********* bytes : $bytes");
    debugPrint("********* base64Url : $base64Url");
    final uri = Uri(
        scheme: 'https',
        host: 'animation-demo-49cad.web.app',
        queryParameters: {'data': base64Url});
    return uri.toString();
  }

  readLargeFile() async {
    String contents = await compute(_readFile, "largefile.txt");
    //debugPrint(contents);
  }

  String _readFile(String path) {
    File file = File(path);
    return file.readAsStringSync();
  }
}
