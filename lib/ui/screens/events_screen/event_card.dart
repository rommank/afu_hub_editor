import 'package:afu_hub_editor/models/EventData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../router.dart';

class EventCard extends ConsumerWidget {
  const EventCard({
    required this.event,
    super.key,
  });

  final EventData event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        onTap: () => context.push(ScreenPaths.event, extra: event),
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
                        child: event.iconKey != null
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, dynamic error) =>
                                      const Icon(Icons.error_outline_outlined),
                                  imageUrl: 'event.iconUrl.toString()',
                                  cacheKey: event.iconKey,
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
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
                        event.title.uk.toString(),
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

class PhotoCard extends StatelessWidget {
  const PhotoCard({this.child, this.image, Key? key}) : super(key: key);
  final Widget? child;
  final DecorationImage? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        image: image,
      ),
      child: child,
    );
  }
}
// class EventCard extends ConsumerWidget {
//   const EventCard({
//     required this.event,
//     super.key,
//   });
//
//   final EventData event;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return InkWell(
//         splashColor: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.circular(15),
//         onTap: () {
//           context.push(ScreenPaths.event, extra: event);
//         },
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           elevation: 5.0,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   alignment: Alignment.center,
//                   color: Theme.of(context).colorScheme.secondaryContainer,
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: event.iconKey != null
//                             ? Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: CachedNetworkImage(
//                                   errorWidget: (context, url, dynamic error) =>
//                                       const Icon(Icons.error_outline_outlined),
//                                   imageUrl: event.iconUrl.toString(),
//                                   cacheKey: event.iconKey,
//                                   width: double.maxFinite,
//                                   alignment: Alignment.topCenter,
//                                   fit: BoxFit.scaleDown,
//                                 ),
//                               )
//                             : Padding(
//                                 padding: const EdgeInsets.all(15),
//                                 child: Image.asset(
//                                   'assets/images/app-logo.png',
//                                   fit: BoxFit.scaleDown,
//                                   color: Theme.of(context).colorScheme.onSecondaryContainer,
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
//                 child: DefaultTextStyle(
//                   softWrap: true,
//                   maxLines: 3,
//                   overflow: TextOverflow.fade,
//                   style: Theme.of(context).textTheme.titleMedium!,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         event.title.uk.toString(),
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
