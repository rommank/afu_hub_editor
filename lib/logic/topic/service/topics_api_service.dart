import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/TopicData.dart';
part 'topics_api_service.g.dart';

@riverpod
TopicsApiService topicsApiService(TopicsApiServiceRef ref) {
  return TopicsApiService();
}

class TopicsApiService {
  Future<List<TopicData?>> list() async {
    try {
      final request =
          ModelQueries.list(TopicData.classType, authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.query(request: request).response;
      final topics = response.data?.items;
      if (topics == null) {
        safePrint("Errors: ${response.errors}");
        return const [];
      }
      return topics;
    } on ApiException catch (error) {
      safePrint('Query topics: $error');
      return const [];
    }
  }

  Stream<List<TopicData?>> listen() {
    final topicList = list();
    return Stream.fromFuture(topicList);
  }

  Future<void> add(TopicData topic) async {
    try {
      final request =
          ModelMutations.create(topic, authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api mutation failed: $e');
    }
  }

  Future<void> update(TopicData topic) async {
    try {
      final request = ModelMutations.update(topic);
      final response = await Amplify.API.mutate(request: request).response;
      print('Update response is: $response');
    } on ApiException catch (e) {
      safePrint('Error: $e');
    }
  }

  Future<void> delete(TopicData topic) async {
    try {
      final request = ModelMutations.delete(topic);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api delete failed: $e');
    }
  }
}
