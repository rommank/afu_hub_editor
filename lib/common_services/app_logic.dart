import '../main.dart';
import '../router.dart';

class AppLogic {
  bool isBootstrapComplete = false;

  Future<void> bootstrap() async {
    await amplifyService.configureAmplify();
    isBootstrapComplete = true;
    appRouter.go(ScreenPaths.home);
  }
}
