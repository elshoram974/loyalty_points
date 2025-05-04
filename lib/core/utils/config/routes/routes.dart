import 'package:get/get.dart';

import '../../../../features/auth/presentation/screens/waiting_screen.dart';
import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../../../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/sign_up_bindings.dart';
import '../../middleware/login_middleware.dart';

// import '../../bindings/questions_bindings.dart';
// import '../../bindings/home_bindings.dart';
// import '../../bindings/login_bindings.dart';
// import '../../bindings/orders_bindings.dart';
// import '../../bindings/reports_bindings.dart';
// import '../../middleware/login_middleware.dart';

abstract final class AppRoute {
  const AppRoute();

  static const String login = "/login";
  static const String signUp = "/sign-up";
  static const String home = "/home";
  static const String waiting = "/waiting";


  static List<GetPage> get pages => [
        GetPage(
          name: login,
          page: () => const LoginScreen(),
          binding: LoginBindings(),
          middlewares: [LoginMiddleWare(Get.find<AuthLocalDataSource>())],
        ),
        GetPage(
          name: signUp,
          binding: SignUpBindings(),
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: home,
          page: () => const HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: waiting,
          page: () => const WaitingScreen(),
        ),
      ];
}
