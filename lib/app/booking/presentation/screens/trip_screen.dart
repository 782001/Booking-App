import 'package:booking_app/app/booking/presentation/screens/cancelled%20.dart';
import 'package:booking_app/app/booking/presentation/screens/completed.dart';
import 'package:booking_app/app/booking/presentation/screens/upcomming.dart';

import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_theme_colors.dart';

class TripsScren extends StatelessWidget {
  const TripsScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.kGreyColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            top: 5.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'My Trip',
                fontWeight: FontWeight.bold,
                size: 24,
                color: AppColors.kTextColor1,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: context.height * 0.07,
                // width: context.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.kwhite,
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.teal[400],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.kwhite,
                  ),
                  indicatorColor: AppColors.kwhite,
                  tabs: [
                    Tab(
                      child: CustomText(
                        text: 'upcomming ',
                        size: 10.sp,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'completed',
                        size: 10.sp,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'cancelled ',
                        size: 10.sp,
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    UpCommingScreen(),
                    CompletedScreen(),
                    CancelledScreen()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
