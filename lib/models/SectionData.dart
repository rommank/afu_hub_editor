/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the SectionData type in your schema. */
@immutable
class SectionData extends Model {
  static const classType = const _SectionDataModelType();
  final String id;
  final LocalizedText? _title;
  final LocalizedText? _text1;
  final LocalizedText? _text2;
  final Quote? _quote1;
  final LocalizedText? _callout1;
  final int? _order;
  final String? _topicId;
  final TermToExplain? _termToExplain1;
  final String? _iconKey;
  final LocalizedText? _callout2;
  final String? _photo1Key;
  final String? _photo2Key;
  final String? _photo3Key;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SectionDataModelIdentifier get modelIdentifier {
      return SectionDataModelIdentifier(
        id: id
      );
  }
  
  LocalizedText get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  LocalizedText get text1 {
    try {
      return _text1!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  LocalizedText? get text2 {
    return _text2;
  }
  
  Quote? get quote1 {
    return _quote1;
  }
  
  LocalizedText? get callout1 {
    return _callout1;
  }
  
  int get order {
    try {
      return _order!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get topicId {
    return _topicId;
  }
  
  TermToExplain? get termToExplain1 {
    return _termToExplain1;
  }
  
  String? get iconKey {
    return _iconKey;
  }
  
  LocalizedText? get callout2 {
    return _callout2;
  }
  
  String? get photo1Key {
    return _photo1Key;
  }
  
  String? get photo2Key {
    return _photo2Key;
  }
  
  String? get photo3Key {
    return _photo3Key;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SectionData._internal({required this.id, required title, required text1, text2, quote1, callout1, required order, topicId, termToExplain1, iconKey, callout2, photo1Key, photo2Key, photo3Key, createdAt, updatedAt}): _title = title, _text1 = text1, _text2 = text2, _quote1 = quote1, _callout1 = callout1, _order = order, _topicId = topicId, _termToExplain1 = termToExplain1, _iconKey = iconKey, _callout2 = callout2, _photo1Key = photo1Key, _photo2Key = photo2Key, _photo3Key = photo3Key, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SectionData({String? id, required LocalizedText title, required LocalizedText text1, LocalizedText? text2, Quote? quote1, LocalizedText? callout1, required int order, String? topicId, TermToExplain? termToExplain1, String? iconKey, LocalizedText? callout2, String? photo1Key, String? photo2Key, String? photo3Key}) {
    return SectionData._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      text1: text1,
      text2: text2,
      quote1: quote1,
      callout1: callout1,
      order: order,
      topicId: topicId,
      termToExplain1: termToExplain1,
      iconKey: iconKey,
      callout2: callout2,
      photo1Key: photo1Key,
      photo2Key: photo2Key,
      photo3Key: photo3Key);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SectionData &&
      id == other.id &&
      _title == other._title &&
      _text1 == other._text1 &&
      _text2 == other._text2 &&
      _quote1 == other._quote1 &&
      _callout1 == other._callout1 &&
      _order == other._order &&
      _topicId == other._topicId &&
      _termToExplain1 == other._termToExplain1 &&
      _iconKey == other._iconKey &&
      _callout2 == other._callout2 &&
      _photo1Key == other._photo1Key &&
      _photo2Key == other._photo2Key &&
      _photo3Key == other._photo3Key;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SectionData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + (_title != null ? _title!.toString() : "null") + ", ");
    buffer.write("text1=" + (_text1 != null ? _text1!.toString() : "null") + ", ");
    buffer.write("text2=" + (_text2 != null ? _text2!.toString() : "null") + ", ");
    buffer.write("quote1=" + (_quote1 != null ? _quote1!.toString() : "null") + ", ");
    buffer.write("callout1=" + (_callout1 != null ? _callout1!.toString() : "null") + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("topicId=" + "$_topicId" + ", ");
    buffer.write("termToExplain1=" + (_termToExplain1 != null ? _termToExplain1!.toString() : "null") + ", ");
    buffer.write("iconKey=" + "$_iconKey" + ", ");
    buffer.write("callout2=" + (_callout2 != null ? _callout2!.toString() : "null") + ", ");
    buffer.write("photo1Key=" + "$_photo1Key" + ", ");
    buffer.write("photo2Key=" + "$_photo2Key" + ", ");
    buffer.write("photo3Key=" + "$_photo3Key" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SectionData copyWith({LocalizedText? title, LocalizedText? text1, LocalizedText? text2, Quote? quote1, LocalizedText? callout1, int? order, String? topicId, TermToExplain? termToExplain1, String? iconKey, LocalizedText? callout2, String? photo1Key, String? photo2Key, String? photo3Key}) {
    return SectionData._internal(
      id: id,
      title: title ?? this.title,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      quote1: quote1 ?? this.quote1,
      callout1: callout1 ?? this.callout1,
      order: order ?? this.order,
      topicId: topicId ?? this.topicId,
      termToExplain1: termToExplain1 ?? this.termToExplain1,
      iconKey: iconKey ?? this.iconKey,
      callout2: callout2 ?? this.callout2,
      photo1Key: photo1Key ?? this.photo1Key,
      photo2Key: photo2Key ?? this.photo2Key,
      photo3Key: photo3Key ?? this.photo3Key);
  }
  
  SectionData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['title']['serializedData']))
        : null,
      _text1 = json['text1']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['text1']['serializedData']))
        : null,
      _text2 = json['text2']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['text2']['serializedData']))
        : null,
      _quote1 = json['quote1']?['serializedData'] != null
        ? Quote.fromJson(new Map<String, dynamic>.from(json['quote1']['serializedData']))
        : null,
      _callout1 = json['callout1']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['callout1']['serializedData']))
        : null,
      _order = (json['order'] as num?)?.toInt(),
      _topicId = json['topicId'],
      _termToExplain1 = json['termToExplain1']?['serializedData'] != null
        ? TermToExplain.fromJson(new Map<String, dynamic>.from(json['termToExplain1']['serializedData']))
        : null,
      _iconKey = json['iconKey'],
      _callout2 = json['callout2']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['callout2']['serializedData']))
        : null,
      _photo1Key = json['photo1Key'],
      _photo2Key = json['photo2Key'],
      _photo3Key = json['photo3Key'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title?.toJson(), 'text1': _text1?.toJson(), 'text2': _text2?.toJson(), 'quote1': _quote1?.toJson(), 'callout1': _callout1?.toJson(), 'order': _order, 'topicId': _topicId, 'termToExplain1': _termToExplain1?.toJson(), 'iconKey': _iconKey, 'callout2': _callout2?.toJson(), 'photo1Key': _photo1Key, 'photo2Key': _photo2Key, 'photo3Key': _photo3Key, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'text1': _text1, 'text2': _text2, 'quote1': _quote1, 'callout1': _callout1, 'order': _order, 'topicId': _topicId, 'termToExplain1': _termToExplain1, 'iconKey': _iconKey, 'callout2': _callout2, 'photo1Key': _photo1Key, 'photo2Key': _photo2Key, 'photo3Key': _photo3Key, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<SectionDataModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<SectionDataModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField TEXT1 = QueryField(fieldName: "text1");
  static final QueryField TEXT2 = QueryField(fieldName: "text2");
  static final QueryField QUOTE1 = QueryField(fieldName: "quote1");
  static final QueryField CALLOUT1 = QueryField(fieldName: "callout1");
  static final QueryField ORDER = QueryField(fieldName: "order");
  static final QueryField TOPICID = QueryField(fieldName: "topicId");
  static final QueryField TERMTOEXPLAIN1 = QueryField(fieldName: "termToExplain1");
  static final QueryField ICONKEY = QueryField(fieldName: "iconKey");
  static final QueryField CALLOUT2 = QueryField(fieldName: "callout2");
  static final QueryField PHOTO1KEY = QueryField(fieldName: "photo1Key");
  static final QueryField PHOTO2KEY = QueryField(fieldName: "photo2Key");
  static final QueryField PHOTO3KEY = QueryField(fieldName: "photo3Key");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SectionData";
    modelSchemaDefinition.pluralName = "SectionData";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        provider: AuthRuleProvider.IAM,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["topicId"], name: "byTopicData")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'title',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'text1',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'text2',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'quote1',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Quote')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'callout1',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.ORDER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.TOPICID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'termToExplain1',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TermToExplain')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.ICONKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'callout2',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO1KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO2KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO3KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _SectionDataModelType extends ModelType<SectionData> {
  const _SectionDataModelType();
  
  @override
  SectionData fromJson(Map<String, dynamic> jsonData) {
    return SectionData.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SectionData';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SectionData] in your schema.
 */
@immutable
class SectionDataModelIdentifier implements ModelIdentifier<SectionData> {
  final String id;

  /** Create an instance of SectionDataModelIdentifier using [id] the primary key. */
  const SectionDataModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'SectionDataModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SectionDataModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}