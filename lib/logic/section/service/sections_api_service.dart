import 'package:afu_hub_editor/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sections_api_service.g.dart';

@riverpod
SectionsApiService sectionsApiService(SectionsApiServiceRef ref) {
  return SectionsApiService();
}

class SectionsApiService {
  Future<List<SectionData?>> list() async {
    try {
      final request = ModelQueries.list(SectionData.classType,
          authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.query(request: request).response;
      final sections = response.data?.items;
      if (sections == null) {
        safePrint("Errors: ${response.errors}");
        return const [];
      }
      return sections;
    } on ApiException catch (error) {
      safePrint('Query topics: $error');
      return const [];
    }
  }

  Stream<List<SectionData?>> listen() {
    final sectionList = list();
    return Stream.fromFuture(sectionList);
  }

  Future<void> add(SectionData section) async {
    try {
      final request =
          ModelMutations.create(section, authorizationMode: APIAuthorizationType.userPools);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api mutation failed: $e');
    }
  }

  Future<void> update(SectionData section) async {
    try {
      final request = ModelMutations.update(section);
      final response = await Amplify.API.mutate(request: request).response;
      print('Update response is: $response');
    } on ApiException catch (e) {
      safePrint('Error: $e');
    }
  }

  Future<void> delete(SectionData section) async {
    try {
      final request = ModelMutations.delete(section);
      final response = await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Api delete failed: $e');
    }
  }
}
