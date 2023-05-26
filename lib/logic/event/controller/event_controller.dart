import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:afu_hub_editor/models/EventData.dart';
import 'package:afu_hub_editor/models/LocalizedText.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_services/storage_service.dart';
import '../../../strings.dart';
import 'dart:io' as io;
part 'event_controller.g.dart';

@riverpod
EventController eventController(EventControllerRef ref) {
  return EventController(ref);
}

class EventController {
  EventController(this.ref);
  final Ref ref;

  Future<void> uploadFile(io.File file, EventData event) async {
    final fileKey = await ref.read(storageServiceProvider).uploadFile(file);

    if (fileKey != null) {
      final imageUrl =
          await ref.read(storageServiceProvider).getDownloadUrl(key: fileKey);
      final updatedEvent = event.copyWith(iconKey: fileKey);
      await ref.read(eventsRepositoryProvider).update(updatedEvent);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  Future<EventData?> queryEventWithId(String id) {
    return ref.read(eventsRepositoryProvider).queryById(id);
  }

  Future<void> addEvent(
      {String? id,
      required String date,
      required String titleUk,
      required String titleEn,
      required String topicId}) async {
    DateTime tempDate = DateFormat($Strings.ukDateFormat).parse(date.trim());
    final event = EventData(
        id: id,
        date: TemporalDate(tempDate.copyWith(day: tempDate.day + 1)),
        title: LocalizedText(uk: titleUk, en: titleEn),
        topicId: topicId);
    await ref.read(eventsRepositoryProvider).add(event);
  }

  Future<void> updateEvent(
      {String? id,
      required String date,
      required String titleUk,
      required String titleEn,
      required String topicId}) async {
    DateTime tempDate = DateFormat($Strings.ukDateFormat).parse(date.trim());
    final event = EventData(
        id: id,
        date: TemporalDate(tempDate.copyWith(day: tempDate.day + 1)),
        title: LocalizedText(uk: titleUk, en: titleEn),
        topicId: topicId);
    await ref.read(eventsRepositoryProvider).add(event);
  }
}
