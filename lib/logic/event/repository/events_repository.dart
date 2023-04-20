import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/EventData.dart';
import '../service/events_datastore_service.dart';
part 'events_repository.g.dart';

@riverpod
EventsRepository eventsRepository(EventsRepositoryRef ref) {
  return EventsRepository(ref.read(eventsDataStoreServiceProvider));
}

@riverpod
Stream<List<EventData>> events(EventsRef ref) {
  return ref.watch(eventsRepositoryProvider).listenEvents();
}

class EventsRepository {
  EventsRepository(this.eventsDataStoreService);
  final EventsDataStoreService eventsDataStoreService;
  Stream<List<EventData>> listenEventsForTopic(String topicId) {
    return eventsDataStoreService.listenEventsForTopic(topicId);
  }

  Stream<List<EventData>> listenEvents() {
    return eventsDataStoreService.listenEvents();
  }

  Future<void> updateTopicId(String topicId, List<EventData> events) async {
    await eventsDataStoreService.updateTopicId(topicId, events);
  }
}
