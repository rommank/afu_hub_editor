import 'dart:io' as io;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/EventData.dart';
import '../../models/SectionData.dart';

final addedEventsProvider =
    NotifierProvider<AddedEventForTopicNotifier, List<EventData>>(AddedEventForTopicNotifier.new);

class AddedEventForTopicNotifier extends Notifier<List<EventData>> {
  @override
  List<EventData> build() {
    return [];
  }

  void addValue(EventData value) {
    if (!state.contains(value)) {
      state = List.from(state)..add(value);
    } else {
      state = List.from(state);
    }
  }

  void clear() {
    state.clear();
  }

  void removeValueAtIndex(int index) {
    state = List.from(state)..removeAt(index);
  }
}

final addedSectionsProvider =
    NotifierProvider<SectionsForTopicNotifier, List<SectionData>>(SectionsForTopicNotifier.new);

class SectionsForTopicNotifier extends Notifier<List<SectionData>> {
  @override
  List<SectionData> build() {
    return [];
  }

  void addValue(SectionData value) {
    if (!state.contains(value)) {
      state = List.from(state)..add(value);
    } else {
      state = List.from(state);
    }
  }

  void removeValueAtIndex(int index) {
    state = List.from(state)..removeAt(index);
  }

  void clear() {
    state.clear();
  }
}

final imageValidationProvider =
    NotifierProvider<ImageValidationNotifier, bool>(ImageValidationNotifier.new);

class ImageValidationNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void setValue(bool newValue) {
    state = newValue;
  }
}

final coverImageProvider = NotifierProvider<CoverImageNotifier, io.File?>(CoverImageNotifier.new);

class CoverImageNotifier extends Notifier<io.File?> {
  @override
  io.File? build() {
    return null;
  }

  void setValue(io.File newValue) {
    state = newValue;
  }

  void clear() {
    state = null;
  }
}
