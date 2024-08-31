import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/data/enums.dart';
import 'package:fate_date_demo/provider/filter_type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDialogBody extends StatelessWidget {
  const FilterDialogBody({
    super.key,
    required this.ref,
    required this.overlayEntry,
  });

  final Ref ref;
  final OverlayEntry overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: context.colorScheme.onSurface,
              offset: const Offset(-1, -2),
              blurRadius: 0.1,
              spreadRadius: 0.1,
              blurStyle: BlurStyle.outer,
            ),
          ], borderRadius: AppSpacings.borderRadiusk12All),
          child: Material(
            color: context.colorScheme.surface,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacings.k8),
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(FilterType.values[index].type).onTapWidget(
                onTap: () {
                  ref.read(filterTypeProvider.notifier).update((state) => FilterType.values[index]);
                  overlayEntry.remove();
                },
                tooltip: FilterType.values[index].type,
              ),
              separatorBuilder: (context, index) =>
                  Divider(thickness: 0.3, color: context.colorScheme.onSurface),
              itemCount: FilterType.values.length,
            ),
          ),
        ),
      ],
    );
  }
}
