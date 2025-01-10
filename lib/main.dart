import 'package:animation_demo/provider/hero_anim_provider.dart';
import 'package:animation_demo/provider/tween_anim_provider.dart';
import 'package:animation_demo/pages/tween_anim.dart';
import 'package:animation_demo/routes/routes_config.dart';
import 'package:animation_demo/utils/global_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TweenAnimProvider()),
        ChangeNotifierProvider(create: (context) => HeroAnimProvider())
      ],
      child: MaterialApp.router(
        title: 'Animation Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.getRouter(isAuth: true),
      ),
    );
  }
}
