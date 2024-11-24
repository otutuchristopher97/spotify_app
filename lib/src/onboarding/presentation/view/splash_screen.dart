import 'dart:async';

import 'package:emoodie_music_app/core/resources/app_colors.dart';
import 'package:emoodie_music_app/core/resources/media_res.dart';
import 'package:emoodie_music_app/core/service/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3), () async {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pushReplacementNamed(context, RouteConstants.dashboard);
    });
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset(MediaRes.logo, height: 1500, width: 200,)),
    );
  }
}
