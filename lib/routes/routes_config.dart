import 'package:animation_demo/pages/error.dart';
import 'package:animation_demo/pages/home.dart';
import 'package:animation_demo/pages/tween_anim.dart';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            name: AppRoutesConstants.homeRoute,
            path: "/",
            pageBuilder: (context, state) =>
                const MaterialPage(child: HomePage())),
        GoRoute(
            name: AppRoutesConstants.tweenAnimRoute,
            path: "/tween_anim",
            pageBuilder: (context, state) =>
                const MaterialPage(child: TweenAnimPage()))
      ],
      errorBuilder: (context, state) => const ErrorPage());
}
