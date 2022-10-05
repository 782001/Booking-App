import 'package:booking_app/app/explore/presentation/controller/cubit/explore_cubit.dart';
import 'package:booking_app/app/explore/presentation/controller/cubit/explore_states.dart';
import 'package:booking_app/app/explore/presentation/screens/book_hotel.dart';
import 'package:booking_app/app/explore/presentation/widget/my_text_field.dart';
import 'package:booking_app/app/search/presentation/screens/search.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../widget/card_widget.dart';
import 'dart:math' as math;

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    // super.initState();
    // scrollController.addListener(() {
    //   print(scrollController.position.pixels.toInt());
    //   if (scrollController.position.pixels.toInt() >= 202 ||
    //       scrollController.position.pixels <
    //           scrollController.position.maxScrollExtent) {
    //     BlocProvider.of<ExploreCubit>(context).opacity = 0;
    //   } else if (scrollController.position.pixels.toInt() <= 198) {
    //     BlocProvider.of<ExploreCubit>(context).opacity = 1;
    //   }
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BBGwColor,
        body: BlocConsumer<ExploreCubit, ExploreState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ExploreCubit.get(context);
            print('rebuild');
            if (state is ExploreLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExploreErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 24),
                ),
              );
            } else {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                        minHeight: 38.h,
                        maxHeight: 70.h,
                        child: Stack(
                          children: [
                            Slider(),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 6.h, left: 2.6.h, right: 2.6.h),
                              child: const MyTextField(),
                            ),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: 1,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4.h, vertical: 5.h),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.h))),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchScreen()));
                                    },
                                    child: Text(
                                      'View Hotel',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListView.builder(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            int indexImg = math.Random().nextInt(
                                cubit.data!.hotelData[index].images.length);
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => BookHotelScreen(
                                            hotelDataEntities:
                                                cubit.data!.hotelData[index],
                                            indexOfImg: indexImg))));
                              },
                              child: CardExploreWidget(
                                  hotel: cubit.data!.hotelData[index],
                                  indexOfImg: indexImg),
                            );
                          },
                          itemCount: cubit.data!.hotelData.length,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}

class SliverAppBarModel {
  final String imageUrl;
  final String title;
  final String desc;
  SliverAppBarModel({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });
}

List<SliverAppBarModel> sliverAppBarModel = [
  SliverAppBarModel(
    title: 'Cape Town',
    desc: 'Extoardinary five-star\n outdoor activities',
    imageUrl: 'assets/images/bg.webp',
  ),
  SliverAppBarModel(
    title: 'Find best deals',
    desc: 'Extoardinary five-star\n outdoor activities',
    imageUrl: 'assets/images/bg1.webp',
  ),
  SliverAppBarModel(
    title: 'Find best deals',
    desc: 'Extoardinary five-star\n outdoor activities',
    imageUrl: 'assets/images/bg2.jpg',
  )
];

Widget Slider() => CarouselSlider(
    items: sliverAppBarModel
        .map(
          (e) => Stack(
            children: [
              Image(
                height: 70.h,
                width: double.infinity,
                image: AssetImage(e.imageUrl),
                fit: BoxFit.cover,
              ),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.h, left: 5.h),
                    child: CustomText(
                      text: e.title,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 14.h, left: 5.h),
                    child: CustomText(
                        color: Colors.white, size: 12.sp, text: e.desc),
                  ),
                ),
              )
            ],
          ),
        )
        .toList(),
    options: CarouselOptions(
        height: 70.h,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        scrollDirection: Axis.horizontal));
