import 'package:afu_hub_editor/logic/topic/repository/topics_repository.dart';
import '../../../models/TopicData.dart';
import '../service/topics_datastore_service.dart';

class TopicsDataStoreRepository implements TopicsRepository {
  TopicsDataStoreRepository(this.topicsDataStoreService);
  final TopicsDataStoreService topicsDataStoreService;

  @override
  Stream<List<TopicData>> listen() {
    return topicsDataStoreService.listen();
  }

  @override
  Stream<TopicData> listenToId(String id) {
    return topicsDataStoreService.listenToId(id);
  }

  @override
  Future<TopicData?> queryById(String id) {
    return topicsDataStoreService.queryById(id);
  }

  @override
  Future<List<TopicData?>> list() {
    return topicsDataStoreService.list();
  }

  @override
  Future<void> add(TopicData topic) async {
    await topicsDataStoreService.add(topic);
  }

  @override
  Future<void> delete(TopicData topic) {
    return topicsDataStoreService.delete(topic);
  }

  @override
  Future<void> update(TopicData topic) {
    return topicsDataStoreService.update(topic);
  }
}
