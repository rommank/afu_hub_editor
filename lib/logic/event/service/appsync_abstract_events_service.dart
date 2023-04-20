import '../../../models/EventData.dart';

abstract class AppSyncAbstractEventService {
  Stream<List<EventData>> listenEventsForTopic(String topicId);
  Stream<List<EventData>> listenEvents();
  Future<void> updateTopicId(String topicId, List<EventData> events);
}
