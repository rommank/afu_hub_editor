import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/SectionData.dart';
import 'appsync_abstract_sections_service.dart';
part 'sections_datastore_service.g.dart';

@riverpod
SectionsDataStoreService sectionsDataStoreService(SectionsDataStoreServiceRef ref) {
  return SectionsDataStoreService();
}

class SectionsDataStoreService implements AppSyncAbstractSectionsService {
  @override
  Stream<List<SectionData>> listenToSectionsForTopicId(String topicId) {
    return Amplify.DataStore.observeQuery(SectionData.classType,
            where: SectionData.TOPICDATAID.eq(topicId))
        .map((event) => event.items.toList());
  }

  @override
  Stream<List<SectionData>> getAndListenToSections() {
    return Amplify.DataStore.observeQuery(SectionData.classType)
        .map((event) => event.items.toList());
  }

  @override
  Future<void> updateTopicId(String topicId, List<SectionData> sections) async {
    for (var section in sections) {
      await Amplify.DataStore.save(section.copyWith(topicDataID: topicId));
    }
  }
}
