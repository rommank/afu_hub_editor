import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import '../../../models/SectionData.dart';
import '../service/sections_datastore_service.dart';

class SectionsDataStoreRepository implements SectionsRepository {
  SectionsDataStoreRepository(this.appSyncAbstractSectionsService);
  final SectionsDataStoreService appSyncAbstractSectionsService;

  @override
  Stream<List<SectionData>> listenSectionsForTopicId(String id) {
    return appSyncAbstractSectionsService.listenToSectionsForTopicId(id);
  }

  @override
  Stream<List<SectionData?>> listen() {
    return appSyncAbstractSectionsService.listen();
  }

  @override
  Future<void> update(SectionData section) async {
    await appSyncAbstractSectionsService.update(section);
  }

  @override
  Future<void> add(SectionData topic) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(SectionData topic) {
    // TODO: implement delete
    throw UnimplementedError();
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
  Future<SectionData?> queryById(String idd) {
    // TODO: implement queryById
    throw UnimplementedError();
  }
}