import 'package:emoodie_music_app/core/resources/app_colors.dart';
import 'package:emoodie_music_app/core/resources/media_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: Center(child: Lottie.asset(MediaRes.pageUnderConstruction)),
    );
  }
}
