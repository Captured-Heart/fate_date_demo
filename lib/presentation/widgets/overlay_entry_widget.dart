import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/presentation/widgets/filter_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayEntryWidget extends StatelessWidget {
  const OverlayEntryWidget({super.key, required this.overlayEntry, required this.ref});
  final OverlayEntry overlayEntry;
  final Ref ref;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.deviceHeight(0.22),
      left: context.deviceWidth(0.1),
      right: context.deviceWidth(0.08),
      child: FilterDialogBody(
        ref: ref,
        overlayEntry: overlayEntry,
      ),
    );
  }
}
