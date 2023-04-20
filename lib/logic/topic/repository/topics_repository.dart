import 'package:afu_hub_editor/logic/topic/repository/topics_api_repository.dart';
import 'package:afu_hub_editor/logic/topic/repository/topics_data_store_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/TopicData.dart';
import '../service/topics_api_service.dart';
import '../service/topics_datastore_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
part 'topics_repository.g.dart';

@riverpod
TopicsRepository topicsRepository(TopicsRepositoryRef ref) {
  return kIsWeb
      ? TopicsApiRepository(ref.read(topicsApiServiceProvider))
      : TopicsDataStoreRepository(ref.read(topicsDataStoreServiceProvider));
}

@riverpod
Stream<List<TopicData?>> topicsStream(TopicsStreamRef ref) {
  return ref.watch(topicsRepositoryProvider).listen();
}

@riverpod
Stream sectionsStream(SectionsStreamRef ref) {
  return ref.watch(topicsRepositoryProvider).listen();
}

@riverpod
Stream<TopicData> singleTopic(SingleTopicRef ref, {required String id}) {
  return ref.watch(topicsRepositoryProvider).listenToId(id);
}

abstract class TopicsRepository {
  Stream<List<TopicData?>> listen();
  Stream<TopicData> listenToId(String id);
  Future<List<TopicData?>> list();
  Future<TopicData?> queryById(String idd);
  Future<void> add(TopicData topic);
  Future<void> update(TopicData topic);
  Future<void> delete(TopicData topic);
}
