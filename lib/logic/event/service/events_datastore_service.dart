import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/EventData.dart';
import '../../../models/SectionData.dart';
import 'appsync_abstract_events_service.dart';
part 'events_datastore_service.g.dart';

@riverpod
EventsDataStoreService eventsDataStoreService(EventsDataStoreServiceRef ref) {
  return EventsDataStoreService();
}

class EventsDataStoreService implements AppSyncAbstractEventService {
  @override
  Stream<List<EventData>> listenEventsForTopic(String topicId) {
    return Amplify.DataStore.observeQuery(EventData.classType,
            where: SectionData.TOPICDATAID.eq(topicId))
        .map((event) => event.items.toList());
  }

  @override
  Stream<List<EventData>> listenEvents() {
    return Amplify.DataStore.observeQuery(EventData.classType).map((event) => event.items.toList());
  }

  // @override
  // Future<void> updateEvent(EventData event) async {
  //   try {
  //     final eventsWithId =
  //         await Amplify.DataStore.query(EventData.classType, where: EventData.ID.eq(topic.id));
  //
  //     final oldEvent = eventsWithId.first;
  //
  //     final newEvent = oldEvent.copyWith(
  //       date: event.date,
  //       title: event.title,
  //       text: event.text,
  //       topicdataID: event.topicdataID,
  //     );
  //
  //     await Amplify.DataStore.save(newEvent);
  //   } on Exception catch (error) {
  //     safePrint(error);
  //   }
  // }

  @override
  Future<void> updateTopicId(String topicId, List<EventData> events) async {
    for (var event in events) {
      await Amplify.DataStore.save(event.copyWith(topicdataID: topicId));
    }
  }
}
