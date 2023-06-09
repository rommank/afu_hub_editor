import 'package:afu_hub_editor/common_services/storage_service.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../logic/event/service/image_picker_provider.dart';
import '../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../strings.dart';
import 'dart:io' as io;
import 'package:flutter/foundation.dart' show kIsWeb;

final containerHeightProvider = StateProvider<double>((ref) => 48);

class CoverImageCard extends ConsumerWidget {
  const CoverImageCard({
    this.imageKey,
    this.label,
    Key? key,
  }) : super(key: key);

  final String? imageKey;

  final String? label;

  Future<void> pickImageFromGallery(WidgetRef ref) async {
    final pickedImage = await ref
        .read(imagePickerProvider)
        .pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      safePrint('No image selected');
    } else {
      ref.read(coverImageProvider.notifier).setValue(io.File(pickedImage.path));

      ref.read(containerHeightProvider.notifier).state = 150;
    }
  }

  Widget? pickImageWidget(
      {io.File? pickedImage,
      String? existingImageKey,
      required WidgetRef ref}) {
    if (pickedImage != null) {
      Future(() {
        ref.read(containerHeightProvider.notifier).state = 150;
      });

      return kIsWeb ? Image.network(pickedImage.path) : Image.file(pickedImage);
    }
    if (existingImageKey != null) {
      Future(() {
        ref.read(containerHeightProvider.notifier).state = 150;
      });
      return FutureBuilder(
          future: ref
              .read(storageServiceProvider)
              .getDownloadUrl(key: existingImageKey),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return CachedNetworkImage(imageUrl: snapshot.data!.toString());
            }
            return const Center(child: CircularProgressIndicator());
          });
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final coverImage = ref.watch(coverImageProvider);
    final containerHeight = ref.watch(containerHeightProvider);
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => pickImageFromGallery(ref),
      borderRadius: BorderRadius.circular(15),
      child:
          // (imageUrl != null && ref.read(coverImageProvider) == null)
          //  ? pickImageWidget(ref: ref, existingImageUrl: imageUrl) :
          AnimatedContainer(
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
                  child: pickImageWidget(
                      existingImageKey: imageKey,
                      pickedImage: ref.read(coverImageProvider),
                      ref: ref),
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
                        label ?? $Strings.addCoverImage,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      const Gap(8),
                      Icon(Icons.image_outlined,
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
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
