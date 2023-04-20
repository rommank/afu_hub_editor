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
  Future<void> add(TopicData topic) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(TopicData topic) {
    // TODO: implement delete
    throw UnimplementedError();
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

  @override
  Future<void> update(TopicData topic) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
