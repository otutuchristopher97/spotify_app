part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return _pageBuilder(
        (_) => const SplashScreen(),
        settings: settings,
      );
    case RouteConstants.dashboard:
      return _pageBuilder(
        (_) => const DashboadScreen(),
        settings: settings,
      );
      
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}


class RouteConstants {
  const RouteConstants._();

  static const dashboard = "/dashboard";
  static const splashScreen = "/splashscreen";
}