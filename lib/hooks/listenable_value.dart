import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

T useListenableState<T extends SingleValueDropDownController>(T data) {
  final state = useState<T>(data);
  return useListenable(state.value);

}
