import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'event_controller.g.dart';

@riverpod
EventController eventController(EventControllerRef ref) {
  return EventController(ref);
}

class EventController {
  EventController(this.ref);
  final Ref ref;
}
