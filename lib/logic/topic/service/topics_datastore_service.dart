import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/TopicData.dart';
part 'topics_datastore_service.g.dart';

@riverpod
TopicsDataStoreService topicsDataStoreService(TopicsDataStoreServiceRef ref) {
  return TopicsDataStoreService();
}

class TopicsDataStoreService {
  Stream<List<TopicData>> listen() {
    return Amplify.DataStore.observeQuery(
      TopicData.classType,
    ).map((event) => event.items.toList()).handleError(
      (error) {
        debugPrint('listenToTopics: A Stream error happened');
      },
    );
  }

  Future<List<TopicData?>> list() async {
    return Amplify.DataStore.query(TopicData.classType);
  }

  Future<void> add(TopicData topic) async {
    try {
      await Amplify.DataStore.save(topic);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Future<void> delete(TopicData topic) async {
    try {
      await Amplify.DataStore.delete(topic);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Future<void> update(TopicData topic) async {
    try {
      final topicsWithId = await Amplify.DataStore.query(TopicData.classType,
          where: TopicData.ID.eq(topic.id));

      final oldTopic = topicsWithId.first;

      final newTopic = oldTopic.copyWith(
          bgColor: topic.bgColor,
          fgColor: topic.fgColor,
          title: topic.title,
          startDate: topic.startDate,
          bgImageKey: topic.bgImageKey,
          endDate: topic.endDate);

      await Amplify.DataStore.save(newTopic);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Stream<TopicData> listenToId(String topicId) {
    return Amplify.DataStore.observeQuery(TopicData.classType,
            where: TopicData.ID.eq(topicId))
        .map((event) => event.items.toList().first)
        .handleError((error) {
      safePrint("Listen to events: stream error occurred");
    });
  }

  Future<TopicData?> queryById(String topicId) async {
    try {
      final topicsWithId = await Amplify.DataStore.query(TopicData.classType,
          where: TopicData.ID.eq(topicId));
      return topicsWithId.first;
    } on Exception catch (error) {
      safePrint(error);
      return null;
    }
  }
}
