import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _DropDownControllerHookCreator {
  const _DropDownControllerHookCreator();

  SingleValueDropDownController call() {
    return use(const _DropDownControllerHook(null));
  }

  SingleValueDropDownController fromValue(DropDownValueModel value) {
    return use(_DropDownControllerHook(value));
  }
}

const useDropDownController = _DropDownControllerHookCreator();

class _DropDownControllerHook extends Hook<SingleValueDropDownController> {
  const _DropDownControllerHook(this.initialValue);
  @override
  __DropDownControllerHookState createState() => __DropDownControllerHookState();
  final DropDownValueModel? initialValue;
}

class __DropDownControllerHookState
    extends HookState<SingleValueDropDownController, _DropDownControllerHook> {
  late SingleValueDropDownController controller;

  @override
  void initHook() {
    super.initHook();
    controller = SingleValueDropDownController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final _controller = hook.initialValue != null
      ? SingleValueDropDownController(data: hook.initialValue)
      : SingleValueDropDownController();

  @override
  SingleValueDropDownController build(BuildContext context) => _controller;
}
