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
  // Stream<List<EventData?>> listen() {
  //   final subscriptionRequest = ModelSubscriptions.onCreate(EventData.classType,
  //       authorizationMode: APIAuthorizationType.userPools);
  //
  //   final fut = Amplify.API
  //       .subscribe(
  //         subscriptionRequest,
  //         onEstablished: () => safePrint('Subscription established'),
  //       )
  //       .take(5)
  //       .handleError(
  //         (Object error) {
  //           safePrint('Error in subscription stream: $error');
  //         },
  //       )
  //       .map((event) => event.data)
  //       .toList();
  //
  //   final operation = Stream.fromFuture(fut);
  //   return operation;
  // }

  Future<void> add(EventData event) async {
    try {
      final request =
          ModelMutations.create(event, authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api mutation failed: $e');
    }
  }

  Future<void> update(EventData event) async {
    try {
      final request = ModelMutations.update(event);
      final response = await Amplify.API.mutate(request: request).response;
      print('Update response is: $response');
    } on ApiException catch (e) {
      safePrint('Error: $e');
    }
  }

  Future<void> delete(EventData event) async {
    try {
      final request = ModelMutations.delete(event);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api delete failed: $e');
    }
  }
}
