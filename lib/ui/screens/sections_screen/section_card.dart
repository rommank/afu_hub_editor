import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../models/SectionData.dart';

class SectionCard extends ConsumerWidget {
  const SectionCard({
    required this.section,
    super.key,
  });

  final SectionData section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          context.pushNamed('section', extra: section);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5.0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: section.iconKey != null
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, dynamic error) =>
                                      const Icon(Icons.error_outline_outlined),
                                  imageUrl: section.iconUrl.toString(),
                                  cacheKey: section.iconKey,
                                  width: double.maxFinite,
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.scaleDown,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  'assets/images/app-logo.png',
                                  fit: BoxFit.scaleDown,
                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                child: DefaultTextStyle(
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.titleMedium!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title.uk.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
