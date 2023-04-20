import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/LocalizedText.dart';
import '../../../models/SectionData.dart';
import '../../../models/Topic.dart';
import '../../../models/TopicData.dart';
import '../repository/topics_repository.dart';
part 'topics_list_controller.g.dart';

@riverpod
TopicsListController topicsListController(TopicsListControllerRef ref) {
  return TopicsListController(ref.read(topicsRepositoryProvider));
}

class TopicsListController {
  TopicsListController(this.topicsRepository);
  final TopicsRepository topicsRepository;
  Future<void> add(
      {String? id,
      List<SectionData>? sections,
      required LocalizedText title,
      required Topic type,
      required TemporalDate startDate,
      required TemporalDate endDate}) async {
    TopicData topic = TopicData(
        id: id,
        title: title,
        type: type,
        startDate: startDate,
        endDate: endDate,
        sections: sections);
    await topicsRepository.add(topic);
  }
}
