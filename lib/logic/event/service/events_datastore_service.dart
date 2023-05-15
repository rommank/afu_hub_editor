import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/EventData.dart';
import '../../../models/SectionData.dart';
part 'events_datastore_service.g.dart';

@riverpod
EventsDataStoreService eventsDataStoreService(EventsDataStoreServiceRef ref) {
  return EventsDataStoreService();
}

class EventsDataStoreService {
  Stream<List<EventData>> listenEventsForTopicId(String topicId) {
    return Amplify.DataStore.observeQuery(EventData.classType,
            where: SectionData.TOPICID.eq(topicId))
        .map((event) => event.items.toList())
        .handleError((error) {
      safePrint("Listen to events for topicId : stream error occurred");
    });
  }

  Stream<List<EventData>> listen() {
    return Amplify.DataStore.observeQuery(EventData.classType)
        .map((event) => event.items.toList())
        .handleError((error) {
      safePrint("Listen to events: stream error occurred");
    });
  }

  Future<void> add(EventData event) async {
    try {
      await Amplify.DataStore.save(event);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Future<void> update(EventData event) async {
    try {
      final eventWithId =
          await Amplify.DataStore.query(EventData.classType, where: SectionData.ID.eq(event.id));
      final oldEvent = eventWithId.single;
      final newEvent = oldEvent.copyWith(
          date: event.date,
          title: event.title,
          text: event.text,
          topicId: event.topicId,
          iconKey: event.iconKey,
          iconUrl: event.iconUrl);

      await Amplify.DataStore.save(newEvent);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Future<EventData?> queryById(String id) async {
    try {
      final eventsWithId =
          await Amplify.DataStore.query(EventData.classType, where: EventData.ID.eq(id));
      return eventsWithId.first;
    } on Exception catch (error) {
      safePrint(error);
      return null;
    }
  }

  Future<List<EventData?>> queryByTopicId(String id) async {
    try {
      final eventsWithId =
          await Amplify.DataStore.query(EventData.classType, where: EventData.TOPICID.eq(id));
      return eventsWithId;
    } on Exception catch (error) {
      safePrint(error);
      return [];
    }
  }

  Stream<EventData> listenToId(String id) {
    return Amplify.DataStore.observeQuery(EventData.classType, where: EventData.ID.eq(id))
        .map((event) => event.items.toList().single)
        .handleError((error) {
      safePrint("Listen to event with id: stream error occurred");
    });
  }

  Future<void> delete(EventData event) async {
    try {
      await Amplify.DataStore.delete(event);
    } on Exception catch (error) {
      safePrint(error);
    }
  }
}
