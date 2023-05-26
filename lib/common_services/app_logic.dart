import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_logic.g.dart';

@riverpod
AppLogic appLogic(AppLogicRef ref) {
  return AppLogic(ref);
}

class AppLogic {
  AppLogic(this.ref);
  bool isBootstrapComplete = false;
  final Ref ref;

  Future<void> bootstrap() async {
    isBootstrapComplete = true;
  }
}
