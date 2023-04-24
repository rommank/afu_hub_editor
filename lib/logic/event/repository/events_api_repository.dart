import 'package:afu_hub_editor/models/EventData.dart';
import '../service/events_api_service.dart';
import 'events_repository.dart';

class EventsApiRepository implements EventsRepository {
  EventsApiRepository(this.eventsApiService);
  final EventsApiService eventsApiService;

  @override
  Future<List<EventData?>> list() {
    return eventsApiService.list();
  }

  @override
  Stream<List<EventData?>> listen() {
    return eventsApiService.listen();
  }

  @override
  Future<void> add(EventData event) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(EventData event) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Stream<List<EventData?>> listenEventsForTopicId(String id) {
    // TODO: implement listenEventsForTopicId
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
