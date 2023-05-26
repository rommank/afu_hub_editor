import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/SectionData.dart';
part 'sections_datastore_service.g.dart';

@riverpod
SectionsDataStoreService sectionsDataStoreService(
    SectionsDataStoreServiceRef ref) {
  return SectionsDataStoreService();
}

class SectionsDataStoreService {
  Stream<List<SectionData>> listenToSectionsForTopicId(String topicId) {
    return Amplify.DataStore.observeQuery(SectionData.classType,
            where: SectionData.TOPICID.eq(topicId))
        .map((event) => event.items.toList());
  }

  Future<SectionData?> queryById(String id) async {
    try {
      final sectionsWithId = await Amplify.DataStore.query(
          SectionData.classType,
          where: SectionData.ID.eq(id));
      return sectionsWithId.first;
    } on Exception catch (error) {
      safePrint(error);
      return null;
    }
  }

  Future<List<SectionData?>> queryByTopicId(String id) async {
    try {
      final sectionsWithId = await Amplify.DataStore.query(
          SectionData.classType,
          where: SectionData.TOPICID.eq(id));
      return sectionsWithId;
    } on Exception catch (error) {
      safePrint(error);
      return [];
    }
  }

  Stream<List<SectionData>> listen() {
    return Amplify.DataStore.observeQuery(SectionData.classType)
        .map((event) => event.items.toList())
        .handleError(
      (error) {
        safePrint("Listen to sections: stream error occurred");
      },
    );
  }

  Future<void> add(SectionData section) async {
    try {
      Amplify.DataStore.save(section);
    } on Exception catch (error) {
      safePrint("Add section data: error occurred: $error");
    }
  }

  Future<void> update(SectionData section) async {
    try {
      final sectionsWithId = await Amplify.DataStore.query(
          SectionData.classType,
          where: SectionData.ID.eq(section.id));
      final oldSection = sectionsWithId.first;
      final newSection = oldSection.copyWith(
        title: section.title,
        text1: section.text1,
        text2: section.text2,
        quote1: section.quote1,
        callout1: section.callout1,
        callout2: section.callout2,
        photo2Key: section.photo2Key,
        photo3Key: section.photo3Key,
        iconKey: section.iconKey,
        topicId: section.topicId,
        order: section.order,
        termToExplain1: section.termToExplain1,
        photo1Key: section.photo1Key,
      );

      await Amplify.DataStore.save(newSection);
    } on Exception catch (error) {
      safePrint(error);
    }
  }

  Future<void> delete(SectionData section) async {
    try {
      await Amplify.DataStore.delete(section);
    } on Exception catch (error) {
      safePrint(error);
    }
  }
}
