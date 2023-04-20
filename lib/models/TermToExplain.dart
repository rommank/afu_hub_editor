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


/** This is an auto generated class representing the TermToExplain type in your schema. */
@immutable
class TermToExplain {
  final LocalizedText? _term;
  final LocalizedText? _meaning;

  LocalizedText? get term {
    return _term;
  }
  
  LocalizedText? get meaning {
    return _meaning;
  }
  
  const TermToExplain._internal({term, meaning}): _term = term, _meaning = meaning;
  
  factory TermToExplain({LocalizedText? term, LocalizedText? meaning}) {
    return TermToExplain._internal(
      term: term,
      meaning: meaning);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermToExplain &&
      _term == other._term &&
      _meaning == other._meaning;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TermToExplain {");
    buffer.write("term=" + (_term != null ? _term!.toString() : "null") + ", ");
    buffer.write("meaning=" + (_meaning != null ? _meaning!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TermToExplain copyWith({LocalizedText? term, LocalizedText? meaning}) {
    return TermToExplain._internal(
      term: term ?? this.term,
      meaning: meaning ?? this.meaning);
  }
  
  TermToExplain.fromJson(Map<String, dynamic> json)  
    : _term = json['term']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['term']['serializedData']))
        : null,
      _meaning = json['meaning']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['meaning']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'term': _term?.toJson(), 'meaning': _meaning?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'term': _term, 'meaning': _meaning
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TermToExplain";
    modelSchemaDefinition.pluralName = "TermToExplains";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'term',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'meaning',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
  });
}