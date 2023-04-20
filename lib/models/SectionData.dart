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
  final LocalizedText? _name;
  final LocalizedText? _text1;
  final LocalizedText? _text2;
  final Quote? _quote1;
  final LocalizedText? _callout1;
  final LocalizedText? _callout2;
  final String? _photo2;
  final String? _photo3;
  final String? _icon;
  final String? _topicDataID;
  final ImageData? _imageData;
  final int? _order;
  final TermToExplain? _termToExplain1;
  final String? _photo1;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _sectionDataImageDataId;

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
  
  LocalizedText get name {
    try {
      return _name!;
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
  
  LocalizedText? get callout2 {
    return _callout2;
  }
  
  String? get photo2 {
    return _photo2;
  }
  
  String? get photo3 {
    return _photo3;
  }
  
  String? get icon {
    return _icon;
  }
  
  String get topicDataID {
    try {
      return _topicDataID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  ImageData? get imageData {
    return _imageData;
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
  
  TermToExplain? get termToExplain1 {
    return _termToExplain1;
  }
  
  String? get photo1 {
    return _photo1;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get sectionDataImageDataId {
    return _sectionDataImageDataId;
  }
  
  const SectionData._internal({required this.id, required name, required text1, text2, quote1, callout1, callout2, photo2, photo3, icon, required topicDataID, imageData, required order, termToExplain1, photo1, createdAt, updatedAt, sectionDataImageDataId}): _name = name, _text1 = text1, _text2 = text2, _quote1 = quote1, _callout1 = callout1, _callout2 = callout2, _photo2 = photo2, _photo3 = photo3, _icon = icon, _topicDataID = topicDataID, _imageData = imageData, _order = order, _termToExplain1 = termToExplain1, _photo1 = photo1, _createdAt = createdAt, _updatedAt = updatedAt, _sectionDataImageDataId = sectionDataImageDataId;
  
  factory SectionData({String? id, required LocalizedText name, required LocalizedText text1, LocalizedText? text2, Quote? quote1, LocalizedText? callout1, LocalizedText? callout2, String? photo2, String? photo3, String? icon, required String topicDataID, ImageData? imageData, required int order, TermToExplain? termToExplain1, String? photo1, String? sectionDataImageDataId}) {
    return SectionData._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      text1: text1,
      text2: text2,
      quote1: quote1,
      callout1: callout1,
      callout2: callout2,
      photo2: photo2,
      photo3: photo3,
      icon: icon,
      topicDataID: topicDataID,
      imageData: imageData,
      order: order,
      termToExplain1: termToExplain1,
      photo1: photo1,
      sectionDataImageDataId: sectionDataImageDataId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SectionData &&
      id == other.id &&
      _name == other._name &&
      _text1 == other._text1 &&
      _text2 == other._text2 &&
      _quote1 == other._quote1 &&
      _callout1 == other._callout1 &&
      _callout2 == other._callout2 &&
      _photo2 == other._photo2 &&
      _photo3 == other._photo3 &&
      _icon == other._icon &&
      _topicDataID == other._topicDataID &&
      _imageData == other._imageData &&
      _order == other._order &&
      _termToExplain1 == other._termToExplain1 &&
      _photo1 == other._photo1 &&
      _sectionDataImageDataId == other._sectionDataImageDataId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SectionData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + (_name != null ? _name!.toString() : "null") + ", ");
    buffer.write("text1=" + (_text1 != null ? _text1!.toString() : "null") + ", ");
    buffer.write("text2=" + (_text2 != null ? _text2!.toString() : "null") + ", ");
    buffer.write("quote1=" + (_quote1 != null ? _quote1!.toString() : "null") + ", ");
    buffer.write("callout1=" + (_callout1 != null ? _callout1!.toString() : "null") + ", ");
    buffer.write("callout2=" + (_callout2 != null ? _callout2!.toString() : "null") + ", ");
    buffer.write("photo2=" + "$_photo2" + ", ");
    buffer.write("photo3=" + "$_photo3" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("topicDataID=" + "$_topicDataID" + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("termToExplain1=" + (_termToExplain1 != null ? _termToExplain1!.toString() : "null") + ", ");
    buffer.write("photo1=" + "$_photo1" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("sectionDataImageDataId=" + "$_sectionDataImageDataId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SectionData copyWith({LocalizedText? name, LocalizedText? text1, LocalizedText? text2, Quote? quote1, LocalizedText? callout1, LocalizedText? callout2, String? photo2, String? photo3, String? icon, String? topicDataID, ImageData? imageData, int? order, TermToExplain? termToExplain1, String? photo1, String? sectionDataImageDataId}) {
    return SectionData._internal(
      id: id,
      name: name ?? this.name,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      quote1: quote1 ?? this.quote1,
      callout1: callout1 ?? this.callout1,
      callout2: callout2 ?? this.callout2,
      photo2: photo2 ?? this.photo2,
      photo3: photo3 ?? this.photo3,
      icon: icon ?? this.icon,
      topicDataID: topicDataID ?? this.topicDataID,
      imageData: imageData ?? this.imageData,
      order: order ?? this.order,
      termToExplain1: termToExplain1 ?? this.termToExplain1,
      photo1: photo1 ?? this.photo1,
      sectionDataImageDataId: sectionDataImageDataId ?? this.sectionDataImageDataId);
  }
  
  SectionData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['name']['serializedData']))
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
      _callout2 = json['callout2']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['callout2']['serializedData']))
        : null,
      _photo2 = json['photo2'],
      _photo3 = json['photo3'],
      _icon = json['icon'],
      _topicDataID = json['topicDataID'],
      _imageData = json['imageData']?['serializedData'] != null
        ? ImageData.fromJson(new Map<String, dynamic>.from(json['imageData']['serializedData']))
        : null,
      _order = (json['order'] as num?)?.toInt(),
      _termToExplain1 = json['termToExplain1']?['serializedData'] != null
        ? TermToExplain.fromJson(new Map<String, dynamic>.from(json['termToExplain1']['serializedData']))
        : null,
      _photo1 = json['photo1'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _sectionDataImageDataId = json['sectionDataImageDataId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name?.toJson(), 'text1': _text1?.toJson(), 'text2': _text2?.toJson(), 'quote1': _quote1?.toJson(), 'callout1': _callout1?.toJson(), 'callout2': _callout2?.toJson(), 'photo2': _photo2, 'photo3': _photo3, 'icon': _icon, 'topicDataID': _topicDataID, 'imageData': _imageData?.toJson(), 'order': _order, 'termToExplain1': _termToExplain1?.toJson(), 'photo1': _photo1, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'sectionDataImageDataId': _sectionDataImageDataId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'text1': _text1, 'text2': _text2, 'quote1': _quote1, 'callout1': _callout1, 'callout2': _callout2, 'photo2': _photo2, 'photo3': _photo3, 'icon': _icon, 'topicDataID': _topicDataID, 'imageData': _imageData, 'order': _order, 'termToExplain1': _termToExplain1, 'photo1': _photo1, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'sectionDataImageDataId': _sectionDataImageDataId
  };

  static final QueryModelIdentifier<SectionDataModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<SectionDataModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TEXT1 = QueryField(fieldName: "text1");
  static final QueryField TEXT2 = QueryField(fieldName: "text2");
  static final QueryField QUOTE1 = QueryField(fieldName: "quote1");
  static final QueryField CALLOUT1 = QueryField(fieldName: "callout1");
  static final QueryField CALLOUT2 = QueryField(fieldName: "callout2");
  static final QueryField PHOTO2 = QueryField(fieldName: "photo2");
  static final QueryField PHOTO3 = QueryField(fieldName: "photo3");
  static final QueryField ICON = QueryField(fieldName: "icon");
  static final QueryField TOPICDATAID = QueryField(fieldName: "topicDataID");
  static final QueryField IMAGEDATA = QueryField(
    fieldName: "imageData",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ImageData'));
  static final QueryField ORDER = QueryField(fieldName: "order");
  static final QueryField TERMTOEXPLAIN1 = QueryField(fieldName: "termToExplain1");
  static final QueryField PHOTO1 = QueryField(fieldName: "photo1");
  static final QueryField SECTIONDATAIMAGEDATAID = QueryField(fieldName: "sectionDataImageDataId");
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
      ModelIndex(fields: const ["topicDataID"], name: "byTopicData")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'name',
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'callout2',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO2,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO3,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.ICON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.TOPICDATAID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: SectionData.IMAGEDATA,
      isRequired: false,
      ofModelName: 'ImageData',
      associatedKey: ImageData.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.ORDER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'termToExplain1',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TermToExplain')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.PHOTO1,
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SectionData.SECTIONDATAIMAGEDATAID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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