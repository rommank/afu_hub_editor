import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import 'package:afu_hub_editor/models/SectionData.dart';

import '../service/sections_api_service.dart';

class SectionsApiRepository implements SectionsRepository {
  SectionsApiRepository(this.sectionsApiService);
  final SectionsApiService sectionsApiService;

  @override
  Future<List<SectionData?>> list() {
    return sectionsApiService.list();
  }

  @override
  Stream<List<SectionData?>> listen() {
    return sectionsApiService.listen();
  }

  @override
  Future<void> add(SectionData section) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(SectionData section) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Stream<List<SectionData?>> listenSectionsForTopicId(String id) {
    // TODO: implement listenSectionsForTopicId
    throw UnimplementedError();
  }

  @override
  Stream<SectionData> listenToId(String id) {
    // TODO: implement listenToId
    throw UnimplementedError();
  }

  @override
  Future<SectionData?> queryById(String id) {
    // TODO: implement queryById
    throw UnimplementedError();
  }

  @override
  Future<void> update(SectionData section) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
