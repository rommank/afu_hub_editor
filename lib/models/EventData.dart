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


/** This is an auto generated class representing the EventData type in your schema. */
@immutable
class EventData extends Model {
  static const classType = const _EventDataModelType();
  final String id;
  final TemporalDate? _date;
  final LocalizedText? _title;
  final LocalizedText? _text;
  final String? _topicId;
  final String? _iconKey;
  final String? _iconUrl;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventDataModelIdentifier get modelIdentifier {
      return EventDataModelIdentifier(
        id: id
      );
  }
  
  TemporalDate get date {
    try {
      return _date!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  LocalizedText? get text {
    return _text;
  }
  
  String? get topicId {
    return _topicId;
  }
  
  String? get iconKey {
    return _iconKey;
  }
  
  String? get iconUrl {
    return _iconUrl;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EventData._internal({required this.id, required date, required title, text, topicId, iconKey, iconUrl, createdAt, updatedAt}): _date = date, _title = title, _text = text, _topicId = topicId, _iconKey = iconKey, _iconUrl = iconUrl, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EventData({String? id, required TemporalDate date, required LocalizedText title, LocalizedText? text, String? topicId, String? iconKey, String? iconUrl}) {
    return EventData._internal(
      id: id == null ? UUID.getUUID() : id,
      date: date,
      title: title,
      text: text,
      topicId: topicId,
      iconKey: iconKey,
      iconUrl: iconUrl);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventData &&
      id == other.id &&
      _date == other._date &&
      _title == other._title &&
      _text == other._text &&
      _topicId == other._topicId &&
      _iconKey == other._iconKey &&
      _iconUrl == other._iconUrl;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("title=" + (_title != null ? _title!.toString() : "null") + ", ");
    buffer.write("text=" + (_text != null ? _text!.toString() : "null") + ", ");
    buffer.write("topicId=" + "$_topicId" + ", ");
    buffer.write("iconKey=" + "$_iconKey" + ", ");
    buffer.write("iconUrl=" + "$_iconUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventData copyWith({TemporalDate? date, LocalizedText? title, LocalizedText? text, String? topicId, String? iconKey, String? iconUrl}) {
    return EventData._internal(
      id: id,
      date: date ?? this.date,
      title: title ?? this.title,
      text: text ?? this.text,
      topicId: topicId ?? this.topicId,
      iconKey: iconKey ?? this.iconKey,
      iconUrl: iconUrl ?? this.iconUrl);
  }
  
  EventData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _title = json['title']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['title']['serializedData']))
        : null,
      _text = json['text']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['text']['serializedData']))
        : null,
      _topicId = json['topicId'],
      _iconKey = json['iconKey'],
      _iconUrl = json['iconUrl'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date?.format(), 'title': _title?.toJson(), 'text': _text?.toJson(), 'topicId': _topicId, 'iconKey': _iconKey, 'iconUrl': _iconUrl, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'date': _date, 'title': _title, 'text': _text, 'topicId': _topicId, 'iconKey': _iconKey, 'iconUrl': _iconUrl, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<EventDataModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<EventDataModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField TEXT = QueryField(fieldName: "text");
  static final QueryField TOPICID = QueryField(fieldName: "topicId");
  static final QueryField ICONKEY = QueryField(fieldName: "iconKey");
  static final QueryField ICONURL = QueryField(fieldName: "iconUrl");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventData";
    modelSchemaDefinition.pluralName = "EventData";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventData.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'title',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'text',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventData.TOPICID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventData.ICONKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: EventData.ICONURL,
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

class _EventDataModelType extends ModelType<EventData> {
  const _EventDataModelType();
  
  @override
  EventData fromJson(Map<String, dynamic> jsonData) {
    return EventData.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EventData';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EventData] in your schema.
 */
@immutable
class EventDataModelIdentifier implements ModelIdentifier<EventData> {
  final String id;

  /** Create an instance of EventDataModelIdentifier using [id] the primary key. */
  const EventDataModelIdentifier({
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
  String toString() => 'EventDataModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventDataModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}