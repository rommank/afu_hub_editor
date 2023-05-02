import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import 'package:afu_hub_editor/models/EventData.dart';
import 'package:afu_hub_editor/models/LocalizedText.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/SectionData.dart';
part 'section_controller.g.dart';

@riverpod
SectionController sectionController(SectionControllerRef ref) {
  return SectionController(ref);
}

class SectionController {
  SectionController(this.ref);
  final Ref ref;

  Future<void> addSection(
      {required String nameUk,
      required String nameEn,
      required String text1Uk,
      required String text1En,
      required String order,
      required String topicId}) async {
    final section = SectionData(
        title: LocalizedText(uk: nameUk, en: nameEn),
        topicId: topicId,
        text1: LocalizedText(uk: text1Uk, en: text1En),
        order: 1);
    await ref.read(sectionsRepositoryProvider).add(section);
  }
}
