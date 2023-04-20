import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_services/storage_service.dart';
import '../../../models/LocalizedText.dart';
import '../../../models/SectionData.dart';
import '../../../models/Topic.dart';
import '../../../models/TopicData.dart';
import 'dart:io' as io;
import '../../section/repository/sections_repository.dart';
import '../repository/topics_repository.dart';

part 'topic_controller.g.dart';

@riverpod
TopicController topicController(TopicControllerRef ref) {
  return TopicController(ref);
}

class TopicController {
  TopicController(this.ref);
  Ref ref;

  Future<void> uploadFile(io.File file, TopicData topic) async {
    final fileKey = await ref.read(storageServiceProvider).uploadFile(file);

    if (fileKey != null) {
      final imageUrl = await ref
          .read(storageServiceProvider)
          .getDownloadUrl(key: fileKey, accessLevel: StorageAccessLevel.guest);
      final updatedTopic = topic.copyWith(titleImageKey: fileKey, titleImageUrl: imageUrl);
      await ref.read(topicsRepositoryProvider).update(updatedTopic);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  ValueNotifier<double> uploadProgress() {
    return ref.read(storageServiceProvider).getUploadProgress();
  }

  Future<void> edit(TopicData updatedTopic) async {
    ref.read(topicsRepositoryProvider).update(updatedTopic);
  }

  Future<TopicData?> queryTopicWithId(String topicId) {
    return ref.read(topicsRepositoryProvider).queryById(topicId);
  }

  Future<void> update(TopicData topic) async {
    await ref.read(topicsRepositoryProvider).update(topic);
  }

  Future<void> updateTopicIdForSections(
      {required String topicId, required List<SectionData> sections}) async {
    await ref.read(sectionsRepositoryProvider).updateTopicId(topicId: topicId, sections: sections);
  }

  Future<void> addTopic({
    required String id,
    required String titleUk,
    required String titleEn,
    required String type,
    required String startDate,
    required String endDate,
  }) async {
    DateTime tempStartDate = DateFormat("dd/MM/yyyy").parse(startDate);
    DateTime tempEndDate = DateFormat("dd/MM/yyyy").parse(endDate);
    final topic = TopicData(
        id: id,
        title: LocalizedText(uk: titleUk, en: titleEn),
        type: Topic.values.byName(type ?? ''),
        startDate: TemporalDate(tempStartDate.copyWith(day: tempStartDate.day + 1)),
        endDate: TemporalDate(tempEndDate.copyWith(day: tempEndDate.day + 1)));
    ref.read(topicsRepositoryProvider).add(topic);
  }
}
