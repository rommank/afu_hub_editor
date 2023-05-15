import 'package:afu_hub_editor/logic/section/repository/sections_api_repository.dart';
import 'package:afu_hub_editor/logic/section/repository/sections_datastore_repository.dart';
import 'package:afu_hub_editor/logic/section/service/sections_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/SectionData.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../service/sections_datastore_service.dart';

part 'sections_repository.g.dart';

@riverpod
SectionsRepository sectionsRepository(SectionsRepositoryRef ref) {
  return kIsWeb
      ? SectionsApiRepository((ref.read(sectionsApiServiceProvider)))
      : SectionsDataStoreRepository(ref.read(sectionsDataStoreServiceProvider));
}

@riverpod
Stream<List<SectionData?>> sectionsForTopic(SectionsForTopicRef ref, {required String id}) {
  return ref.watch(sectionsRepositoryProvider).listenSectionsForTopicId(id);
}

@riverpod
Stream<List<SectionData?>> sections(SectionsRef ref) {
  return ref.watch(sectionsRepositoryProvider).listen();
}

abstract class SectionsRepository {
  Stream<List<SectionData?>> listen();
  Stream<List<SectionData?>> listenSectionsForTopicId(String id);
  Stream<SectionData> listenToId(String id);
  Future<List<SectionData?>> list();
  Future<SectionData?> queryById(String id);
  Future<List<SectionData?>> queryByTopicId(String id);
  Future<void> add(SectionData section);
  Future<void> update(SectionData section);
  Future<void> delete(SectionData section);
}
