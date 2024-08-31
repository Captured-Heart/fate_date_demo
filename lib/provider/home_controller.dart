import 'package:fate_date_demo/presentation/widgets/overlay_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController(ref);
});

class HomeController extends ChangeNotifier {
  HomeController(this.ref);
  GlobalKey<FormState> formkey = GlobalKey();
  OverlayEntry? _overlayEntry;
  Ref ref;
  void showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => OverlayEntryWidget(overlayEntry: _overlayEntry!, ref: ref),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }
}
