import 'package:animation_demo/models/user_model.dart';
import 'package:animation_demo/pages/error.dart';
import 'package:animation_demo/pages/home.dart';
import 'package:animation_demo/pages/tween_anim.dart';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter getRouter({bool isAuth = false}) {
    GoRouter router = GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
              name: AppRoutesConstants.homeRoute,
              path: "/",
              pageBuilder: (context, state) =>
                  const MaterialPage(child: HomePage())),
          GoRoute(
              name: AppRoutesConstants.tweenAnimRoute,
              path: "/tween_anim/:is_opacity/:username",
              pageBuilder: (context, state) {
                Map<String, UserModel> arg =
                    state.extra as Map<String, UserModel>;
                return MaterialPage(
                    child: TweenAnimPage(
                  isOpacity: state.pathParameters["is_opacity"]!,
                  userName: state.pathParameters["username"]!,
                  userModel: arg["user_model"]!,
                ));
              })
        ],
        redirect: (context, state) {
          if (!isAuth &&
              state.matchedLocation
                  .startsWith("/${AppRoutesConstants.tweenAnimRoute}")) {
            return context.namedLocation(AppRoutesConstants.homeRoute);
          } else {
            return null;
          }
        },
        errorBuilder: (context, state) => const ErrorPage());
    return router;
  }
}
