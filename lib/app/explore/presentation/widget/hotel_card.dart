import 'dart:ui';

import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/hotel_data.dart';
import '../controller/cubit/explore_cubit.dart';
import '../controller/cubit/explore_states.dart';

class HotelBookCard extends StatelessWidget {
  final HotelDataEntities? hotel;
  const HotelBookCard({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          var image = hotel!.images[0];
          var rate = double.parse(hotel!.rate);
          return Stack(
            children: [
              Container(
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
              Positioned(
                bottom: context.toPadding,
                left: context.toPadding * 3,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    height: context.height * 0.25,
                    width: context.width * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black.withOpacity(0.5),
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
                              text: hotel!.name,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              textOverflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: hotel!.address,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 14,
                                    textOverflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                ),
                                CustomText(
                                  text: '\$${hotel!.price}',
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
            ],
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  const CustomButton({
    Key? key,
    required this.text,
    this.bottom,
    this.height,
    this.left,
    this.right,
    this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * height!,
      child: Padding(
        padding: EdgeInsets.only(
          left: left!,
          right: right!,
          top: top!,
          bottom: bottom!,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.teal[400],
          ),
          child: Center(
            child: CustomText(
              text: text,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
