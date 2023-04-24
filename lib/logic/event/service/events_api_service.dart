import 'package:afu_hub_editor/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'events_api_service.g.dart';

@riverpod
EventsApiService eventsApiService(EventsApiServiceRef ref) {
  return EventsApiService();
}

class EventsApiService {
  Future<List<EventData?>> list() async {
    try {
      final request =
          ModelQueries.list(EventData.classType, authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.query(request: request).response;
      final events = response.data?.items;
      if (events == null) {
        safePrint("Errors: ${response.errors}");
        return const [];
      }
      return events;
    } on ApiException catch (error) {
      safePrint('Query topics: $error');
      return const [];
    }
  }

  Stream<List<EventData?>> listen() {
    final eventList = list();
    return Stream.fromFuture(eventList);
  }
}
