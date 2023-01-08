import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;
  const DismissibleWidget(
      {super.key,
      required this.item,
      required this.child,
      required this.onDismissed});

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ObjectKey(item),
        background: Container(
            alignment: Alignment.centerLeft, child: const Text('Approve')),
        secondaryBackground: Container(
            alignment: Alignment.centerRight, child: const Text('Reject')),
        onDismissed: onDismissed,
        child: child,
      );
}
