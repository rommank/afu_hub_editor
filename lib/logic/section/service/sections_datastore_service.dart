import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/SectionData.dart';
part 'sections_datastore_service.g.dart';

@riverpod
SectionsDataStoreService sectionsDataStoreService(SectionsDataStoreServiceRef ref) {
  return SectionsDataStoreService();
}

class SectionsDataStoreService {
  Stream<List<SectionData>> listenToSectionsForTopicId(String topicId) {
    return Amplify.DataStore.observeQuery(SectionData.classType,
            where: SectionData.TOPICDATAID.eq(topicId))
        .map((event) => event.items.toList());
  }

  Stream<List<SectionData>> listen() {
    return Amplify.DataStore.observeQuery(SectionData.classType)
        .map((event) => event.items.toList());
  }

  Future<void> update(SectionData section) async {
    try {
      final sectionsWithId = await Amplify.DataStore.query(SectionData.classType,
          where: SectionData.ID.eq(section.id));
      final oldSection = sectionsWithId.first;
      final newSection = oldSection.copyWith(
          name: section.name,
          text1: section.text1,
          text2: section.text2,
          quote1: section.quote1,
          callout1: section.callout1,
          callout2: section.callout2,
          photo2: section.photo2,
          photo3: section.photo3,
          iconKey: section.iconKey,
          iconUrl: section.iconUrl,
          imageData: section.imageData,
          topicDataID: section.topicDataID,
          order: section.order,
          termToExplain1: section.termToExplain1,
          photo1Key: section.photo1Key,
          photo1Url: section.photo1Url);

      await Amplify.DataStore.save(newSection);
    } on Exception catch (error) {
      safePrint(error);
    }
  }
}
