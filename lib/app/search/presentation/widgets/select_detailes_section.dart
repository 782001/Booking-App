import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/widgets/custom_text.dart';

class SelectDetailsSection extends StatelessWidget {
  const SelectDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'Choose Date',
              color: AppColors.greyLight,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: '26, Sep - 01, Oct',
              color: AppColors.kTextColor1.withOpacity(0.7),
              size: 16,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 70,
          width: 2,
          color: AppColors.greyLight,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Number of Room',
              color: AppColors.greyLight,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: '1 Room 2 People',
              color: AppColors.kTextColor1.withOpacity(0.7),
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
