import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../logic/event/service/image_picker_provider.dart';
import '../../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../../strings.dart';
import '../new_topic_screen.dart';
import 'dart:io' as io;

class CoverImageCard extends ConsumerWidget {
  const CoverImageCard({
    this.imageKey,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String? imageUrl;
  final String? imageKey;

  Future<void> pickImageFromGallery(WidgetRef ref) async {
    final pickedImage = await ref.read(imagePickerProvider).pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      safePrint('No image selected');
    } else {
      ref.read(coverImageProvider.notifier).setValue(io.File(pickedImage.path));
      ref.read(containerHeightProvider.notifier).state = 150;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverImage = ref.watch(coverImageProvider);
    final containerHeight = ref.watch(containerHeightProvider);
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => pickImageFromGallery(ref),
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: 200.milliseconds,
        height: containerHeight,
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: (coverImage != null) ? Image.file(coverImage) : const SizedBox.shrink(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: DefaultTextStyle(
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.titleMedium!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        $Strings.addCoverImage,
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      const Gap(8),
                      Icon(Icons.image_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
