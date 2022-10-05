import 'dart:ui';

import 'package:booking_app/app/explore/presentation/widget/hotel_card.dart';
import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:booking_app/app/search/presentation/controller/cubit.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../controller/state.dart';

class HotelDetailsScreen extends StatelessWidget {
  final Search itemHotel;
  const HotelDetailsScreen({
    Key? key,
    required this.itemHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var image = itemHotel.hotelImages[0].image;
          var rate = double.parse(itemHotel.rate);
          return Stack(
            children: [
              SizedBox(
                height: context.height,
                width: context.width,
                child: Image.network(
                  'http://api.mahmoudtaha.com/images/$image',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      width: double.infinity,
                      height: 28.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade900.withOpacity(0.3),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: itemHotel.name,
                                color: AppColors.kwhite,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: itemHotel.address,
                                      color: Colors.white.withOpacity(0.9),
                                      size: 14,
                                      textOverflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                  ),
                                  CustomText(
                                    text: '\$${itemHotel.price}',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    size: 22,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: rate,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 22,
                                    // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.teal[400],
                                    ),
                                    onRatingUpdate: (rating) {
                                      // print(rating);
                                    },
                                  ),
                                  CustomText(
                                    text: ' 80 Reviews',
                                    color: Colors.white.withOpacity(0.9),
                                    size: 14,
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    text: '/per night',
                                    color: Colors.white.withOpacity(0.9),
                                    size: 14,
                                  ),
                                ],
                              ),
                              const CustomButton(
                                text: 'Book now',
                                left: 25,
                                right: 25,
                                bottom: 10,
                                top: 20,
                                height: 0.09,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
