import 'package:flutter/material.dart';

class AppRouter {
  static List<AppRoute> _routes = [];

  static addRoutes(List<AppRoute> routes) {
    _routes = routes;
  }

  static bool contains(String name) {
    return _routes.any((route) => name == route.name());
  }

  static _setTransition<T>(Duration? duration) {
    duration ??= Duration.zero;

    AppRoute? route = _getRouteByType<T>();
    route?.transition = duration;
  }

  static String name<T>() {
    return '/${T.toString()}';
  }

  static push<T>(
    BuildContext context, {
    Duration? transition,
  }) {
    _setTransition<T>(transition);
    return Navigator.pushNamed(context, name<T>());
  }

  static replace<T>(
    BuildContext context, {
    Duration? transition,
  }) {
    _setTransition<T>(transition);
    return Navigator.pushReplacementNamed(context, name<T>());
  }

  static pop<T>(
    BuildContext context, {
    Duration? transition,
  }) {
    _setTransition<T>(transition);
    return Navigator.pop(context);
  }

  static popUntil<T>(
    BuildContext context, {
    Duration? transition,
  }) {
    _setTransition<T>(transition);
    return Navigator.popUntil(
      context,
      (route) => route.settings.name == name<T>(),
    );
  }

  static popAllAndPush<T>(
    BuildContext context, {
    Duration? transition,
  }) {
    _setTransition<T>(transition);
    return Navigator.pushNamedAndRemoveUntil(
      context,
      name<T>(),
      (route) => false,
    );
  }

  static PageRouteBuilder? buildRoute(RouteSettings settings) {
    AppRoute? route = _getRoute(settings.name!);

    if (route != null) {
      return route.build(settings);
    } else {
      return null;
    }
  }

  static AppRoute? _getRouteByType<T>() {
    return _getRoute(name<T>());
  }

  static AppRoute? _getRoute(String name) {
    AppRoute? route;
    for (AppRoute r in _routes) {
      if (name == r.name()) {
        route = r;
        break;
      }
    }
    return route;
  }
}

class AppRoute {
  Widget Function() route;
  Duration? transition;

  AppRoute(this.route);

  String name() {
    return '/${route.runtimeType.toString().replaceAll('() => ', '')}';
  }

  PageRouteBuilder<dynamic>? build(RouteSettings settings) {
    if (AppRouter.contains(settings.name ?? '')) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => route(),
        transitionDuration: transition ?? Duration.zero,
      );
    } else {
      return null;
    }
  }
}
