import 'package:booking_app/app/search/presentation/controller/cubit.dart';
import 'package:booking_app/app/search/presentation/controller/state.dart';
import 'package:booking_app/app/search/presentation/screens/filter.dart';
import 'package:booking_app/app/search/presentation/screens/map_screen.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchCubit = SearchCubit.get(context);
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.kGreyColor,
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: 'Explore',
            fontWeight: FontWeight.bold,
            size: 24,
            color: AppColors.kTextColor1,
          ),
          backgroundColor: AppColors.kGreyColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.kTextColor1,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MapScreen()));
                },
                icon: const Icon(
                  Icons.map_sharp,
                  color: AppColors.kTextColor1,
                  size: 30,
                )),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 55.0,
                  maxHeight: 55.0,
                  child: Container(
                    height: context.height * 0.066,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          searchCubit.getSearch(
                            name: searchController.text,
                          );
                        }
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'London...',
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 25,
                  )
                ]),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 100.0,
                  maxHeight: 55.0,
                  child: Container(
                    height: 100.0,
                    color: AppColors.kGreyColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              height: 50,
                              width: 2,
                              color: AppColors.greyLight,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            BlocBuilder<SearchCubit, SearchState>(
                              builder: (context, state) {
                                return CustomText(
                                  text:
                                      '${BlocProvider.of<SearchCubit>(context).listSearch.length}   Hotel Found',
                                  color: AppColors.kTextColor1.withOpacity(0.7),
                                  size: 16,
                                  // fontWeight: FontWeight.w300,
                                );
                              },
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FilterScreen()),
                                );
                              },
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Filter',
                                    color:
                                        AppColors.kTextColor1.withOpacity(0.7),
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.filter_list_sharp,
                                    color: Colors.teal[400],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: context.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is SearchErrorState) {
                            return Center(
                              child: Text(
                                state.message.toString(),
                                style: const TextStyle(fontSize: 24),
                              ),
                            );
                          } else {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var image = searchCubit
                                    .listSearch[index].hotelImages[1].image;
                                var rate = double.parse(
                                    searchCubit.listSearch[index].rate);
                                return InkWell(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return BookHotelScreen(

                                    //     hotelDataEntities: searchCubit.listSearch[index],
                                    //   );
                                    // }));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: context.height * 0.22,
                                          width: context.width * 0.99,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'http://api.mahmoudtaha.com/images/$image',
                                              height: context.height * 0.22,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Center(
                                                child: SizedBox(
                                                    height: 25,
                                                    width: 25,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.teal[400],
                                                      strokeWidth: 5,
                                                    )),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                  text: searchCubit
                                                      .listSearch[index].name,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold,
                                                  size: 18,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              const Spacer(),
                                              CustomText(
                                                text:
                                                    '\$${searchCubit.listSearch[index].price}',
                                                color: AppColors.black,
                                                fontWeight: FontWeight.bold,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                  text: searchCubit
                                                      .listSearch[index]
                                                      .address,
                                                  color: AppColors.greyLight,
                                                  size: 14,
                                                  maxLines: 2,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.teal[400],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 20, bottom: 10),
                                          child: Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating: rate,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 22,
                                                // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.teal[400],
                                                ),
                                                onRatingUpdate: (rating) {
                                                  // print(rating);
                                                },
                                              ),
                                              CustomText(
                                                text: ' 80Reviews',
                                                color: AppColors.greyLight,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              itemCount: searchCubit.listSearch.length,
                            );
                          }
                        },
                      ),
                    ),
                    //     if(SearchCubit.get(context).isEnd)
                    // const Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 14.0,
                    //     bottom: 100.0,
                    //   ),
                    //   child: CircularProgressIndicator()
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

ScrollController scrollController = ScrollController();
// @override
// void initState() {
//   SearchCubit.get(context).getSearchPagination(
//     isForce: true,
//   );
//   super.initState();
//   scrollController.addListener(() {
//     if (scrollController.position.extentAfter == 0 &&
//         !SearchCubit.get(context).isEnd &&
//         SearchCubit.get(context).lastPage >
//             SearchCubit.get(context).currentPage) {
//       debugPrint('maxScrollExtent');
//       SearchCubit.get(context).toggleIsEnd();
//       SearchCubit.get(context).getSearchPagination;
//     }
//   });
// }

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
