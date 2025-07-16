import 'dart:async';
import 'dart:convert';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:animation_demo/utils/global_data.dart';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';

import '../models/user_model.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final linkUri = await _appLinks.getInitialLink();
    bool isFlag = false;
    if (linkUri != null) {
      isFlag = true;
      print('${linkUri.queryParameters["data"]}');
      Map map = decodedMapResult(linkUri);
      String screenName = map['screen'];
      String id = map['id'];
      //var uri = Uri.parse(appLink.toString());
      if (screenName == "tween-anim") {
        GoRouter.of(GlobalData.navigatorKey.currentContext!)
            .pushNamed(AppRoutesConstants.tweenAnimRoute, pathParameters: {
          "is_opacity": "1",
          "username": "Alex"
        }, extra: {
          "user_model":
              UserModel(name: "Jonas", address: "New York", profile: "demo_pic")
        });
      }
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) {
        print('${uriValue.queryParameters["data"]}');
        Map map = decodedMapResult(uriValue);
        String screenName = map['screen'];
        String id = map['id'];
        if (screenName == "tween-anim" && !isFlag) {
          GoRouter.of(GlobalData.navigatorKey.currentContext!)
              .pushNamed(AppRoutesConstants.tweenAnimRoute, pathParameters: {
            "is_opacity": "1",
            "username": "Alex"
          }, extra: {
            "user_model": UserModel(
                name: "Jonas", address: "New York", profile: "demo_pic")
          });
        }
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }

  Map decodedMapResult(Uri uri) {
    final decodedBytes = base64Decode(uri.queryParameters["data"]!);
    final jsonString = utf8.decode(decodedBytes);
    Map map = jsonDecode(jsonString);
    return map;
  }
}
