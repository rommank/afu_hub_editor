import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import 'package:afu_hub_editor/logic/section/service/sections_datastore_service.dart';
import 'package:afu_hub_editor/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io' as io;

import '../../../common_services/storage_service.dart';
part 'section_controller.g.dart';

@riverpod
SectionController sectionController(SectionControllerRef ref) {
  return SectionController(ref);
}

class SectionController {
  SectionController(this.ref);
  final Ref ref;

  Future<void> uploadFile(io.File file, SectionData section) async {
    final fileKey = await ref.read(storageServiceProvider).uploadFile(file);

    if (fileKey != null) {
      final imageUrl = await ref
          .read(storageServiceProvider)
          .getDownloadUrl(key: fileKey, accessLevel: StorageAccessLevel.guest);
      final updatedSection = section.copyWith(iconKey: fileKey, iconUrl: imageUrl);
      await ref.read(sectionsRepositoryProvider).update(updatedSection);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  Future<SectionData?> querySectionWithId(String id) async {
    return await ref.read(sectionsRepositoryProvider).queryById(id);
  }

  Future<void> addSection({
    required String nameUk,
    required String nameEn,
    required String text1Uk,
    required String text1En,
    required String order,
    required String topicId,
    String? id,
    String? quote1AuthorUk,
    String? quote1AuthorEn,
    String? quote1TextUk,
    String? quote1TextEn,
    String? term1TermUk,
    String? term1TermEn,
    String? term1MeaningUk,
    String? term1MeaningEn,
    String? callout1Uk,
    String? callout1En,
  }) async {
    final section = SectionData(
        id: id,
        title: LocalizedText(uk: nameUk, en: nameEn),
        topicId: topicId,
        text1: LocalizedText(uk: text1Uk, en: text1En),
        quote1: (quote1AuthorUk != null &&
                quote1AuthorEn != null &&
                quote1TextUk != null &&
                quote1TextEn != null)
            ? Quote(
                author: LocalizedText(uk: quote1AuthorUk, en: quote1AuthorEn),
                text: LocalizedText(uk: quote1TextUk, en: quote1TextEn))
            : null,
        termToExplain1: (term1TermUk != null &&
                term1TermEn != null &&
                term1MeaningUk != null &&
                term1MeaningEn != null)
            ? TermToExplain(
                term: LocalizedText(uk: term1TermUk, en: term1TermEn),
                meaning: LocalizedText(uk: term1MeaningUk, en: term1MeaningEn))
            : null,
        callout1: LocalizedText(uk: callout1Uk, en: callout1En),
        order: 1);
    await ref.read(sectionsRepositoryProvider).add(section);
  }

  Future<void> updateSection({
    required String? id,
    required String nameUk,
    required String nameEn,
    required String text1Uk,
    required String text1En,
    required String order,
    required String topicId,
    String? quote1AuthorUk,
    String? quote1AuthorEn,
    String? quote1TextUk,
    String? quote1TextEn,
    String? term1TermUk,
    String? term1TermEn,
    String? term1MeaningUk,
    String? term1MeaningEn,
    String? callout1Uk,
    String? callout1En,
  }) async {
    final section = SectionData(
        id: id,
        title: LocalizedText(uk: nameUk, en: nameEn),
        topicId: topicId,
        text1: LocalizedText(uk: text1Uk, en: text1En),
        quote1: (quote1AuthorUk != null &&
                quote1AuthorEn != null &&
                quote1TextUk != null &&
                quote1TextEn != null)
            ? Quote(
                author: LocalizedText(uk: quote1AuthorUk, en: quote1AuthorEn),
                text: LocalizedText(uk: quote1TextUk, en: quote1TextEn))
            : null,
        termToExplain1: (term1TermUk != null &&
                term1TermEn != null &&
                term1MeaningUk != null &&
                term1MeaningEn != null)
            ? TermToExplain(
                term: LocalizedText(uk: term1TermUk, en: term1TermEn),
                meaning: LocalizedText(uk: term1MeaningUk, en: term1MeaningEn))
            : null,
        callout1: LocalizedText(uk: callout1Uk, en: callout1En),
        order: 1);
    await ref.read(sectionsRepositoryProvider).update(section);
  }
}
