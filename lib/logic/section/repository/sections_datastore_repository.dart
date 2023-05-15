import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import '../../../models/SectionData.dart';
import '../service/sections_datastore_service.dart';

class SectionsDataStoreRepository implements SectionsRepository {
  SectionsDataStoreRepository(this.sectionsDataStoreService);
  final SectionsDataStoreService sectionsDataStoreService;

  @override
  Stream<List<SectionData>> listenSectionsForTopicId(String id) {
    return sectionsDataStoreService.listenToSectionsForTopicId(id);
  }

  @override
  Stream<List<SectionData?>> listen() {
    return sectionsDataStoreService.listen();
  }

  @override
  Future<void> update(SectionData section) async {
    await sectionsDataStoreService.update(section);
  }

  @override
  Future<void> add(SectionData section) async {
    await sectionsDataStoreService.add(section);
  }

  @override
  Future<void> delete(SectionData section) async {
    await sectionsDataStoreService.delete(section);
  }

  @override
  Future<List<SectionData?>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Stream<SectionData> listenToId(String id) {
    // TODO: implement listenToId
    throw UnimplementedError();
  }

  @override
  Future<SectionData?> queryById(String id) async {
    return await sectionsDataStoreService.queryById(id);
  }

  @override
  Future<List<SectionData?>> queryByTopicId(String id) async {
    return await sectionsDataStoreService.queryByTopicId(id);
  }
}
