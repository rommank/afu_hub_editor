import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import '../../../models/EventData.dart';
import '../service/events_datastore_service.dart';

class EventsDataStoreRepository implements EventsRepository {
  EventsDataStoreRepository(this.eventsDataStoreService);
  final EventsDataStoreService eventsDataStoreService;
  @override
  Stream<List<EventData?>> listenEventsForTopicId(String id) {
    return eventsDataStoreService.listenEventsForTopicId(id);
  }

  @override
  Stream<List<EventData>> listen() {
    return eventsDataStoreService.listen();
  }

  @override
  Future<void> add(EventData event) async {
    await eventsDataStoreService.add(event);
  }

  @override
  Future<void> delete(EventData event) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<EventData?>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Stream<EventData> listenToId(String id) {
    // TODO: implement listenToId
    throw UnimplementedError();
  }

  @override
  Future<EventData?> queryById(String id) {
    // TODO: implement queryById
    throw UnimplementedError();
  }

  @override
  Future<void> update(EventData event) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
