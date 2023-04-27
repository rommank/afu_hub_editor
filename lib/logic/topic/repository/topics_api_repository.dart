import 'package:afu_hub_editor/logic/topic/repository/topics_repository.dart';
import '../../../models/TopicData.dart';
import '../service/topics_api_service.dart';

class TopicsApiRepository implements TopicsRepository {
  TopicsApiRepository(this.topicsApiService);
  final TopicsApiService topicsApiService;
  @override
  Future<List<TopicData?>> list() {
    return topicsApiService.list();
  }

  @override
  Stream<List<TopicData?>> listen() {
    return topicsApiService.listen();
  }

  @override
  Future<void> add(TopicData topic) async {
    await topicsApiService.add(topic);
  }

  @override
  Future<void> update(TopicData topic) async {
    await topicsApiService.update(topic);
  }

  @override
  Future<void> delete(TopicData topic) async {
    await topicsApiService.delete(topic);
  }

  @override
  Stream<TopicData> listenToId(String id) {
    // TODO: implement listenToId
    throw UnimplementedError();
  }

  @override
  Future<TopicData?> queryById(String idd) {
    // TODO: implement queryById
    throw UnimplementedError();
  }
}
