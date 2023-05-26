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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TopicData type in your schema. */
@immutable
class TopicData extends Model {
  static const classType = const _TopicDataModelType();
  final String id;
  final LocalizedText? _title;
  final List<SectionData>? _sections;
  final List<EventData>? _events;
  final TemporalDate? _startDate;
  final TemporalDate? _endDate;
  final String? _bgImageKey;
  final String? _leftImageKey;
  final String? _rightImageKey;
  final String? _topImageKey;
  final String? _bottomImageKey;
  final String? _bgColor;
  final String? _fgColor;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TopicDataModelIdentifier get modelIdentifier {
      return TopicDataModelIdentifier(
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
  
  List<SectionData>? get sections {
    return _sections;
  }
  
  List<EventData>? get events {
    return _events;
  }
  
  TemporalDate get startDate {
    try {
      return _startDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get endDate {
    try {
      return _endDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get bgImageKey {
    return _bgImageKey;
  }
  
  String? get leftImageKey {
    return _leftImageKey;
  }
  
  String? get rightImageKey {
    return _rightImageKey;
  }
  
  String? get topImageKey {
    return _topImageKey;
  }
  
  String? get bottomImageKey {
    return _bottomImageKey;
  }
  
  String? get bgColor {
    return _bgColor;
  }
  
  String? get fgColor {
    return _fgColor;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TopicData._internal({required this.id, required title, sections, events, required startDate, required endDate, bgImageKey, leftImageKey, rightImageKey, topImageKey, bottomImageKey, bgColor, fgColor, createdAt, updatedAt}): _title = title, _sections = sections, _events = events, _startDate = startDate, _endDate = endDate, _bgImageKey = bgImageKey, _leftImageKey = leftImageKey, _rightImageKey = rightImageKey, _topImageKey = topImageKey, _bottomImageKey = bottomImageKey, _bgColor = bgColor, _fgColor = fgColor, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TopicData({String? id, required LocalizedText title, List<SectionData>? sections, List<EventData>? events, required TemporalDate startDate, required TemporalDate endDate, String? bgImageKey, String? leftImageKey, String? rightImageKey, String? topImageKey, String? bottomImageKey, String? bgColor, String? fgColor}) {
    return TopicData._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      sections: sections != null ? List<SectionData>.unmodifiable(sections) : sections,
      events: events != null ? List<EventData>.unmodifiable(events) : events,
      startDate: startDate,
      endDate: endDate,
      bgImageKey: bgImageKey,
      leftImageKey: leftImageKey,
      rightImageKey: rightImageKey,
      topImageKey: topImageKey,
      bottomImageKey: bottomImageKey,
      bgColor: bgColor,
      fgColor: fgColor);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicData &&
      id == other.id &&
      _title == other._title &&
      DeepCollectionEquality().equals(_sections, other._sections) &&
      DeepCollectionEquality().equals(_events, other._events) &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _bgImageKey == other._bgImageKey &&
      _leftImageKey == other._leftImageKey &&
      _rightImageKey == other._rightImageKey &&
      _topImageKey == other._topImageKey &&
      _bottomImageKey == other._bottomImageKey &&
      _bgColor == other._bgColor &&
      _fgColor == other._fgColor;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TopicData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + (_title != null ? _title!.toString() : "null") + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("bgImageKey=" + "$_bgImageKey" + ", ");
    buffer.write("leftImageKey=" + "$_leftImageKey" + ", ");
    buffer.write("rightImageKey=" + "$_rightImageKey" + ", ");
    buffer.write("topImageKey=" + "$_topImageKey" + ", ");
    buffer.write("bottomImageKey=" + "$_bottomImageKey" + ", ");
    buffer.write("bgColor=" + "$_bgColor" + ", ");
    buffer.write("fgColor=" + "$_fgColor" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TopicData copyWith({LocalizedText? title, List<SectionData>? sections, List<EventData>? events, TemporalDate? startDate, TemporalDate? endDate, String? bgImageKey, String? leftImageKey, String? rightImageKey, String? topImageKey, String? bottomImageKey, String? bgColor, String? fgColor}) {
    return TopicData._internal(
      id: id,
      title: title ?? this.title,
      sections: sections ?? this.sections,
      events: events ?? this.events,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      bgImageKey: bgImageKey ?? this.bgImageKey,
      leftImageKey: leftImageKey ?? this.leftImageKey,
      rightImageKey: rightImageKey ?? this.rightImageKey,
      topImageKey: topImageKey ?? this.topImageKey,
      bottomImageKey: bottomImageKey ?? this.bottomImageKey,
      bgColor: bgColor ?? this.bgColor,
      fgColor: fgColor ?? this.fgColor);
  }
  
  TopicData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['title']['serializedData']))
        : null,
      _sections = json['sections'] is List
        ? (json['sections'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => SectionData.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _events = json['events'] is List
        ? (json['events'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => EventData.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _startDate = json['startDate'] != null ? TemporalDate.fromString(json['startDate']) : null,
      _endDate = json['endDate'] != null ? TemporalDate.fromString(json['endDate']) : null,
      _bgImageKey = json['bgImageKey'],
      _leftImageKey = json['leftImageKey'],
      _rightImageKey = json['rightImageKey'],
      _topImageKey = json['topImageKey'],
      _bottomImageKey = json['bottomImageKey'],
      _bgColor = json['bgColor'],
      _fgColor = json['fgColor'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title?.toJson(), 'sections': _sections?.map((SectionData? e) => e?.toJson()).toList(), 'events': _events?.map((EventData? e) => e?.toJson()).toList(), 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'bgImageKey': _bgImageKey, 'leftImageKey': _leftImageKey, 'rightImageKey': _rightImageKey, 'topImageKey': _topImageKey, 'bottomImageKey': _bottomImageKey, 'bgColor': _bgColor, 'fgColor': _fgColor, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'sections': _sections, 'events': _events, 'startDate': _startDate, 'endDate': _endDate, 'bgImageKey': _bgImageKey, 'leftImageKey': _leftImageKey, 'rightImageKey': _rightImageKey, 'topImageKey': _topImageKey, 'bottomImageKey': _bottomImageKey, 'bgColor': _bgColor, 'fgColor': _fgColor, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<TopicDataModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TopicDataModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField SECTIONS = QueryField(
    fieldName: "sections",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'SectionData'));
  static final QueryField EVENTS = QueryField(
    fieldName: "events",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'EventData'));
  static final QueryField STARTDATE = QueryField(fieldName: "startDate");
  static final QueryField ENDDATE = QueryField(fieldName: "endDate");
  static final QueryField BGIMAGEKEY = QueryField(fieldName: "bgImageKey");
  static final QueryField LEFTIMAGEKEY = QueryField(fieldName: "leftImageKey");
  static final QueryField RIGHTIMAGEKEY = QueryField(fieldName: "rightImageKey");
  static final QueryField TOPIMAGEKEY = QueryField(fieldName: "topImageKey");
  static final QueryField BOTTOMIMAGEKEY = QueryField(fieldName: "bottomImageKey");
  static final QueryField BGCOLOR = QueryField(fieldName: "bgColor");
  static final QueryField FGCOLOR = QueryField(fieldName: "fgColor");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TopicData";
    modelSchemaDefinition.pluralName = "TopicData";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'title',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TopicData.SECTIONS,
      isRequired: false,
      ofModelName: 'SectionData',
      associatedKey: SectionData.TOPICID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TopicData.EVENTS,
      isRequired: false,
      ofModelName: 'EventData',
      associatedKey: EventData.TOPICID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.STARTDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.ENDDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.BGIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.LEFTIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.RIGHTIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.TOPIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.BOTTOMIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.BGCOLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TopicData.FGCOLOR,
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

class _TopicDataModelType extends ModelType<TopicData> {
  const _TopicDataModelType();
  
  @override
  TopicData fromJson(Map<String, dynamic> jsonData) {
    return TopicData.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TopicData';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TopicData] in your schema.
 */
@immutable
class TopicDataModelIdentifier implements ModelIdentifier<TopicData> {
  final String id;

  /** Create an instance of TopicDataModelIdentifier using [id] the primary key. */
  const TopicDataModelIdentifier({
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
  String toString() => 'TopicDataModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TopicDataModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}