import 'package:flutter_clean_archtecture_boilerplate/presenter/screens/home/home.dart';

import '_tools/app_router.dart';

class Routes {
  static defineRoutes() {
    AppRouter.addRoutes([
      AppRoute(() => HomeView(controller: HomeController())),
    ]);
  }
}
