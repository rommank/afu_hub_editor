import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/SectionData.dart';
import '../service/appsync_abstract_sections_service.dart';
import '../service/sections_datastore_service.dart';
part 'sections_repository.g.dart';

@riverpod
SectionsRepository sectionsRepository(SectionsRepositoryRef ref) {
  return SectionsRepository(ref.read(sectionsDataStoreServiceProvider));
}

@riverpod
Stream<List<SectionData>> sectionsForTopic(SectionsForTopicRef ref, {required String id}) {
  return ref.watch(sectionsRepositoryProvider).getAndListSectionsForTopicId(id);
}

@riverpod
Stream<List<SectionData>> sections(SectionsRef ref) {
  return ref.watch(sectionsRepositoryProvider).getAndListenToSections();
}

class SectionsRepository {
  SectionsRepository(this.appSyncAbstractSectionsService);
  final AppSyncAbstractSectionsService appSyncAbstractSectionsService;

  Stream<List<SectionData>> getAndListSectionsForTopicId(String id) {
    return appSyncAbstractSectionsService.listenToSectionsForTopicId(id);
  }

  Stream<List<SectionData>> getAndListenToSections() {
    return appSyncAbstractSectionsService.getAndListenToSections();
  }

  Future<void> updateTopicId({required String topicId, required List<SectionData> sections}) async {
    await appSyncAbstractSectionsService.updateTopicId(topicId, sections);
  }
}
