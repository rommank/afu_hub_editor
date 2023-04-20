import '../../../models/SectionData.dart';

abstract class AppSyncAbstractSectionsService {
  Stream<List<SectionData>> listenToSectionsForTopicId(String topicId);
  Stream<List<SectionData>> getAndListenToSections();
  Future<void> updateTopicId(String topicId, List<SectionData> sections);
}
