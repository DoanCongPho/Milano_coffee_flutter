import 'package:flutter/material.dart';

class AutoExpandedList extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;
  final EdgeInsets padding;

  const AutoExpandedList({
    super.key,
    required this.children,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(10),
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: padding,
        itemCount: children.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: children[index],
        ),
      ),
    );
  }
}
