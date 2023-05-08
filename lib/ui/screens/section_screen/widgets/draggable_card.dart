import 'package:flutter/material.dart';

class DraggableCard extends StatelessWidget {
  const DraggableCard({
    this.children = const [],
    super.key,
  });

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 60, 16),
              child: Column(
                children: children,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.more_vert, size: 25),
          ),
        ],
      ),
    );
  }
}
