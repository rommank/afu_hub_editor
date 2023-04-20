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


/** This is an auto generated class representing the Quote type in your schema. */
@immutable
class Quote {
  final LocalizedText? _text;
  final LocalizedText? _author;

  LocalizedText? get text {
    return _text;
  }
  
  LocalizedText? get author {
    return _author;
  }
  
  const Quote._internal({text, author}): _text = text, _author = author;
  
  factory Quote({LocalizedText? text, LocalizedText? author}) {
    return Quote._internal(
      text: text,
      author: author);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Quote &&
      _text == other._text &&
      _author == other._author;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Quote {");
    buffer.write("text=" + (_text != null ? _text!.toString() : "null") + ", ");
    buffer.write("author=" + (_author != null ? _author!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Quote copyWith({LocalizedText? text, LocalizedText? author}) {
    return Quote._internal(
      text: text ?? this.text,
      author: author ?? this.author);
  }
  
  Quote.fromJson(Map<String, dynamic> json)  
    : _text = json['text']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['text']['serializedData']))
        : null,
      _author = json['author']?['serializedData'] != null
        ? LocalizedText.fromJson(new Map<String, dynamic>.from(json['author']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'text': _text?.toJson(), 'author': _author?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'text': _text, 'author': _author
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Quote";
    modelSchemaDefinition.pluralName = "Quotes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'text',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'author',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LocalizedText')
    ));
  });
}