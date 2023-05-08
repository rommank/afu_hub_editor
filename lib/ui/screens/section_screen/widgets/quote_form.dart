import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../strings.dart';
import '../../topic_screen/widgets/topic_text_form_field.dart';

class QuoteForm extends HookConsumerWidget {
  const QuoteForm({
    required this.titleEn,
    required this.authorEn,
    required this.textEn,
    required this.quoteEnAuthorController,
    required this.quoteEnTextController,
    required this.titleUk,
    required this.authorUk,
    required this.textUk,
    required this.formGlobalKey,
    required this.quoteUkAuthorController,
    required this.quoteUkTextController,
    super.key,
  });
  final GlobalKey<FormState> formGlobalKey;
  final String titleUk;
  final String authorUk;
  final String textUk;
  final TextEditingController quoteUkAuthorController;
  final TextEditingController quoteUkTextController;
  final String titleEn;
  final String authorEn;
  final String textEn;
  final TextEditingController quoteEnAuthorController;
  final TextEditingController quoteEnTextController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formGlobalKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleUk, style: Theme.of(context).textTheme.bodyLarge),
            const Gap(15),
            buildCustomTextFormField(
              prefixSpace: 12,
              context: context,
              controller: quoteUkAuthorController,
              hintText: authorUk,
              errorText: $Strings.enterQuote1AuthorUk,
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (quoteUkTextController.text.isNotEmpty ||
                        quoteEnAuthorController.text.isNotEmpty ||
                        quoteEnTextController.text.isNotEmpty)) {
                  return $Strings.textFieldIsMandatory;
                }
                return null;
              },
            ),
            const Gap(20),
            buildCustomTextFormField(
              context: context,
              keyboardType: TextInputType.multiline,
              controller: quoteUkTextController,
              hintText: textUk,
              errorText: $Strings.enterQuote1TextUk,
              minLines: 3,
              maxLines: 100,
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (quoteUkAuthorController.text.isNotEmpty ||
                        quoteEnAuthorController.text.isNotEmpty ||
                        quoteEnTextController.text.isNotEmpty)) {
                  return $Strings.textFieldIsMandatory;
                }
                return null;
              },
            ),
            const Gap(15),
            buildCustomTextFormField(
              prefixSpace: 12,
              context: context,
              controller: quoteEnAuthorController,
              hintText: authorEn,
              errorText: $Strings.enterQuote1AuthorEn,
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (quoteUkTextController.text.isNotEmpty ||
                        quoteUkAuthorController.text.isNotEmpty ||
                        quoteEnTextController.text.isNotEmpty)) {
                  return $Strings.textFieldIsMandatory;
                }
                return null;
              },
            ),
            const Gap(20),
            buildCustomTextFormField(
              context: context,
              keyboardType: TextInputType.multiline,
              controller: quoteEnTextController,
              hintText: textEn,
              errorText: $Strings.enterQuote1TextEn,
              minLines: 3,
              maxLines: 100,
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (quoteUkAuthorController.text.isNotEmpty ||
                        quoteUkTextController.text.isNotEmpty ||
                        quoteEnAuthorController.text.isNotEmpty)) {
                  return $Strings.textFieldIsMandatory;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
