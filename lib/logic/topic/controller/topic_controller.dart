import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:afu_hub_editor/models/EventData.dart';
import 'package:afu_hub_editor/strings.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_services/storage_service.dart';
import '../../../models/LocalizedText.dart';
import '../../../models/SectionData.dart';
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
      final imageUrl =
          await ref.read(storageServiceProvider).getDownloadUrl(key: fileKey);
      final updatedTopic = topic.copyWith(bgImageKey: fileKey);
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

  Future<void> updateTopicIdForSections(
      {required String topicId, required List<SectionData> sections}) async {
    final oldSectionsForTopic =
        await ref.read(sectionsRepositoryProvider).queryByTopicId(topicId);
    final sectionsToUpdate = sections;
    final sectionsToRelease =
        oldSectionsForTopic.toSet().difference(sections.toSet());

    if (sectionsToUpdate.isNotEmpty) {
      for (var section in sectionsToUpdate) {
        final updatedSection = section.copyWith(topicId: topicId);
        await ref.read(sectionsRepositoryProvider).update(updatedSection);
      }
    } else if (sectionsToRelease.isNotEmpty) {
      for (var section in sectionsToRelease) {
        final updatedSection = section!.copyWith(topicId: UUID.getUUID());
        await ref.read(sectionsRepositoryProvider).update(updatedSection);
      }
    } else {
      for (var section in sections) {
        final updatedSection = section.copyWith(topicId: topicId);
        await ref.read(sectionsRepositoryProvider).update(updatedSection);
      }
    }
  }

  Future<void> updateTopicIdForEvents(
      {required String topicId, required List<EventData> events}) async {
    final oldEventsForTopic =
        await ref.read(eventsRepositoryProvider).queryByTopicId(topicId);
    final eventsToUpdate = events;
    final eventsToRelease =
        oldEventsForTopic.toSet().difference(events.toSet());

    if (eventsToUpdate.isNotEmpty) {
      for (var event in eventsToUpdate) {
        final updatedEvent = event.copyWith(topicId: topicId);
        await ref.read(eventsRepositoryProvider).update(updatedEvent);
      }
    } else if (eventsToRelease.isNotEmpty) {
      for (var event in eventsToRelease) {
        final updatedEvent = event!.copyWith(topicId: UUID.getUUID());
        await ref.read(eventsRepositoryProvider).update(updatedEvent);
      }
    } else {
      for (var event in events) {
        final updatedEvent = event.copyWith(topicId: topicId);
        await ref.read(eventsRepositoryProvider).update(updatedEvent);
      }
    }
  }

  Future<void> updateTopic({
    required WidgetRef ref,
    required String id,
    required String titleUk,
    required String titleEn,
    required String startDate,
    required String endDate,
    required String bgColor,
    required String fgColor,
    List<SectionData>? sectionList,
    List<EventData>? eventList,
  }) async {
    DateTime tempStartDate = DateFormat($Strings.ukDateFormat).parse(startDate);
    DateTime tempEndDate = DateFormat($Strings.ukDateFormat).parse(endDate);
    final topic = TopicData(
      bgColor: bgColor,
      fgColor: fgColor,
      id: id,
      title: LocalizedText(uk: titleUk, en: titleEn),
      startDate:
          TemporalDate(tempStartDate.copyWith(day: tempStartDate.day + 1)),
      endDate: TemporalDate(
        tempEndDate.copyWith(day: tempEndDate.day + 1),
      ),
    );

    await ref.read(topicsRepositoryProvider).update(topic);

    if (sectionList != null) {
      await updateTopicIdForSections(topicId: id, sections: sectionList);
    }
    if (eventList != null) {
      await updateTopicIdForEvents(topicId: topic.id, events: eventList);
    }
  }

  Future<void> addTopic({
    required WidgetRef ref,
    required String id,
    required String titleUk,
    required String titleEn,
    required String startDate,
    required String endDate,
    required String bgColor,
    required String fgColor,
    List<SectionData>? sectionList,
    List<EventData>? eventList,
  }) async {
    DateTime tempStartDate = DateFormat($Strings.ukDateFormat).parse(startDate);
    DateTime tempEndDate = DateFormat($Strings.ukDateFormat).parse(endDate);
    final topic = TopicData(
      id: id,
      bgColor: bgColor,
      fgColor: fgColor,
      title: LocalizedText(uk: titleUk, en: titleEn),
      startDate:
          TemporalDate(tempStartDate.copyWith(day: tempStartDate.day + 1)),
      endDate: TemporalDate(
        tempEndDate.copyWith(day: tempEndDate.day + 1),
      ),
    );
    ref.read(topicsRepositoryProvider).add(topic);

    if (sectionList != null && sectionList.isNotEmpty) {
      await updateTopicIdForSections(topicId: id, sections: sectionList);
    }
    if (eventList != null && eventList.isNotEmpty) {
      await updateTopicIdForEvents(topicId: topic.id, events: eventList);
    }
  }
}
