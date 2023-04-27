import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:afu_hub_editor/models/EventData.dart';
import 'package:afu_hub_editor/models/LocalizedText.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
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
      final imageUrl = await ref
          .read(storageServiceProvider)
          .getDownloadUrl(key: fileKey, accessLevel: StorageAccessLevel.guest);
      final updatedEvent = event.copyWith(iconKey: fileKey, iconUrl: imageUrl);
      await ref.read(eventsRepositoryProvider).update(updatedEvent);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  Future<void> updateEvent(EventData event) async {
    await ref.read(eventsRepositoryProvider).update(event);
  }

  Future<EventData?> queryEventWithId(String id) {
    return ref.read(eventsRepositoryProvider).queryById(id);
  }

  Future<void> addEvent(
      {required String date,
      required String titleUk,
      required String titleEn,
      required String topicdataID}) async {
    DateTime tempDate = DateFormat($Strings.ukDateFormat).parse(date.trim());
    final event = EventData(
        date: TemporalDate(tempDate.copyWith(day: tempDate.day + 1)),
        title: LocalizedText(uk: titleUk, en: titleEn),
        topicdataID: topicdataID);
    await ref.read(eventsRepositoryProvider).add(event);
  }
}
