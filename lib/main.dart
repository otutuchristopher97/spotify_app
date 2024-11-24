import 'package:emoodie_music_app/core/resources/themes.dart';
import 'package:emoodie_music_app/core/service/injection_container.dart';
import 'package:emoodie_music_app/core/service/router.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardCubit>(),
      child: MaterialApp(
            title: 'eMoodie Music App',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            onGenerateRoute: generateRoute,
            initialRoute: RouteConstants.splashScreen,
          )
      
    );
  }
}

