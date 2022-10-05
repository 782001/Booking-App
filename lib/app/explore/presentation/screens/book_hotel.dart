import 'dart:ui';
import 'package:booking_app/app/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_state.dart';
import 'package:booking_app/app/explore/domain/entities/hotel_data.dart';
import 'package:booking_app/app/explore/presentation/widget/hotel_card.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/widgets/custom_text.dart';
// import '../widget/hotel_card.dart';

class BookHotelScreen extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;
  final int indexOfImg;
  const BookHotelScreen(
      {Key? key, required this.hotelDataEntities, required this.indexOfImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var SearchController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              actions: [
                Container(
                  margin: EdgeInsets.only(left: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle),
                  child: IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {}),
                ),
                SizedBox(
                  width: 1.h,
                )
              ],
              leadingWidth: 14.w,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<BookingCubit>(context).isBooking = false;
                      Navigator.pop(context);
                    }),
              ),
              // collapsedHeight: 150,
              backgroundColor: Colors.brown,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                    color: Colors.white,
                  )),
              expandedHeight: context.height * 1,
              toolbarHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ImageWidget(
                        url:
                            'http://api.mahmoudtaha.com/images/${hotelDataEntities.images[indexOfImg]}'),
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: hotelDataEntities.name,
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
                                            text: hotelDataEntities.address,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            size: 14,
                                            textOverflow: TextOverflow.clip,
                                            maxLines: 1,
                                          ),
                                        ),
                                        CustomText(
                                          text: '\$${hotelDataEntities.price}',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          size: 22,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: double.parse(
                                              (hotelDataEntities.rate)),
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
                                    BlocBuilder<BookingCubit, BookingState>(
                                      builder: (context, state) {
                                        var cubit = BookingCubit.get(context);
                                        return InkWell(
                                          onTap: () {
                                            if (cubit.isBooking == false) {
                                              cubit
                                                  .createBooking(
                                                      hotelId:
                                                          hotelDataEntities.id)
                                                  .then((v) {
                                                cubit.isBooking = true;
                                                cubit.getBooking(
                                                    typeBooking:
                                                        TypeBooking.upcomming);
                                              });
                                            } else {}
                                          },
                                          child: CustomButton(
                                            text: cubit.isBooking
                                                ? 'Done'
                                                : 'Book now',
                                            left: 30,
                                            right: 30,
                                            bottom: 10,
                                            top: 20,
                                            height: 0.1,
                                          ),
                                        );
                                      },
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
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DetailsWidget(
                    hotelDataEntities: hotelDataEntities,
                  )
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) => DetailsWidget(),
                  //   separatorBuilder: (context, index) =>
                  //       const SizedBox(height: 16),
                  //   itemCount: 10,
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}

class DetailsWidget extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;

  const DetailsWidget({super.key, required this.hotelDataEntities});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      iconColor: AppColors.kGreenColor,
      title: const Center(
        child: SizedBox(
          height: 0.1,
        ),
      ),
      children: [
        MoreDetails(
          hotelDataEntities: hotelDataEntities,
        )
      ],
    );
  }
}

class MoreDetails extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;

  const MoreDetails({super.key, required this.hotelDataEntities});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: const MoreDetailsText(),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: hotelDataEntities.name,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 16,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: context.width * .1,
                ),
                CustomText(
                  text: '\$${hotelDataEntities.price}',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  size: 18,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: context.width * .6,
                    child: CustomText(
                      text: hotelDataEntities.address,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      size: 14,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width * .1,
                ),
                CustomText(
                  text: '/per night',
                  color: AppColors.greyLight,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.teal[400],
                ),
                CustomText(
                  text: '2.0Km to city',
                  color: AppColors.greyLight,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        width: double.infinity,
        height: 1,
        color: AppColors.greyLight,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Summary',
              color: AppColors.black,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: hotelDataEntities.description,
              color: AppColors.greyLight,
              size: 14,
              maxLines: 7,
              textOverflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: context.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.greyLight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CustomText(
                          text: '9.5',
                          color: AppColors.kGreenColor,
                          size: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CustomText(
                          text: 'Overall Rating',
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * .01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'Room',
                              color: AppColors.black,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Services',
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              size: 16,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Location',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              size: 16,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Price',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              size: 16,
                            ),
                            // SizedBox(
                            //   height: context.height * .01,
                            // ),
                          ],
                        ),
                        SizedBox(
                          width: context.width * .05,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.height * .01,
                              ),
                              Container(
                                width: context.width * .5,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .4,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .2,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .3,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: context.height * .01,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          height: context.height,
        ),
        // Image.network(
        //   url,
        //   fit: BoxFit.cover,
        //   height: context.height * 1,
        // ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 500,
            start: 80,
            end: 20,
            // bottom: 80,
          ),
          child: Container(),
          //  HotelBookCard(
          //   hotel: Container(),
          // )
        ),
      ],
    );
  }
}

class MoreDetailsText extends StatelessWidget {
  const MoreDetailsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.teal),
      child: const Text(
        'More Details',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
