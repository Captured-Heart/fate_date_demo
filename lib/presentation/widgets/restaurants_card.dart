import 'package:fate_date_demo/core/core.dart';
import 'package:fate_date_demo/domain/restaurants_model.dart';
import 'package:flutter/material.dart';

class RestaurantsCard extends StatelessWidget {
  const RestaurantsCard({
    super.key,
    required this.restaurantsModel,
    required this.index,
  });
  final RestaurantsModel restaurantsModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacings.borderRadiusk12All,
        side: BorderSide(color: Colors.accents[index].withOpacity(0.3), width: 0.5),
      ),
      leading: CircleAvatar(
        radius: AppSpacings.k12,
        child: Text(
          restaurantsModel.id.toString(),
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: BrandColors.kColorWhite,
          ),
        ),
      ),
      title: Text(
        restaurantsModel.name!,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpacings.k8, vertical: AppSpacings.k4),
            decoration: BoxDecoration(
              borderRadius: AppSpacings.borderRadiusk12All,
              color: Colors.accents[index].withOpacity(0.3),
            ),
            child: Text(
              restaurantsModel.cuisine!,
            ),
          ),
        ],
      ),
    ).padOnly(bottom: AppSpacings.k8);
  }
}
