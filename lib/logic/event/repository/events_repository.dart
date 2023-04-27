import 'package:afu_hub_editor/logic/event/repository/events_datastore_repository.dart';
import 'package:afu_hub_editor/logic/event/service/events_api_service.dart';
import 'package:afu_hub_editor/logic/event/service/events_datastore_service.dart';
import 'package:afu_hub_editor/models/EventData.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'events_api_repository.dart';
part 'events_repository.g.dart';

@riverpod
EventsRepository eventsRepository(EventsRepositoryRef ref) {
  return kIsWeb
      ? EventsApiRepository(ref.read(eventsApiServiceProvider))
      : EventsDataStoreRepository(ref.read(eventsDataStoreServiceProvider));
}

@riverpod
Stream<List<EventData?>> eventsForTopic(EventsForTopicRef ref, {required String id}) {
  return ref.watch(eventsRepositoryProvider).listenEventsForTopicId(id);
}

@riverpod
Stream<List<EventData?>> events(EventsRef ref) {
  return ref.watch(eventsRepositoryProvider).listen();
}

@riverpod
Stream<EventData> singleEvent(SingleEventRef ref, {required String id}) {
  return ref.watch(eventsRepositoryProvider).listenToId(id);
}

abstract class EventsRepository {
  Stream<List<EventData?>> listen();
  Stream<List<EventData?>> listenEventsForTopicId(String id);
  Stream<EventData> listenToId(String id);
  Future<List<EventData?>> list();
  Future<EventData?> queryById(String id);
  Future<void> add(EventData event);
  Future<void> update(EventData event);
  Future<void> delete(EventData event);
}
