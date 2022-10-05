import 'package:booking_app/app/explore/presentation/widget/hotel_card.dart';
import 'package:booking_app/app/search/presentation/controller/cubit.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../controller/state.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isAC = false;
  int? ac;
  bool isSeaView = false;
  int? seaView;
  bool isKitchen = false;
  int? kitchen;
  bool isWifi = false;
  int? wifi;
  bool isGarden = false;
  int? garden;
  bool switchAll = false;
  bool switchApartment = false;
  bool switchHome = false;
  bool switchVilla = false;
  bool switchHotel = false;

  RangeValues values = const RangeValues(20, 230);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      ' \$ ${(values.start.toInt()).toString()}',
      ' \$ ${(values.end.toInt()).toString()}',
    );

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchCubit = SearchCubit.get(context);
        var facilities = searchCubit.facilities;
        return Scaffold(
          backgroundColor: AppColors.kGreyColor,
          appBar: AppBar(
            backgroundColor: AppColors.kGreyColor,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: AppColors.kTextColor1,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 25,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Filter',
                    fontWeight: FontWeight.bold,
                    size: 24,
                    color: AppColors.kTextColor1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'price (for 1 night)',
                    color: AppColors.greyLight,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: RangeSlider(
                      min: 20,
                      max: 300,
                      activeColor: Colors.teal[400],
                      inactiveColor: Colors.grey,
                      divisions: 10,
                      labels: labels,
                      values: values,

                      // onChanged: (RangeValues newValues) {
                      //   setState(() {
                      //     values = newValues;
                      //   });
                      // },
                      onChangeEnd: (RangeValues endValues) {
                        //print('Ended change at $endValues');
                      },
                      onChanged: (newValues) {
                        setState(() {
                          values = newValues;
                          // print(values);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 2,
                    color: AppColors.greyLight,
                    indent: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Popular filter',
                    color: AppColors.kTextColor1.withOpacity(0.4),
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal[400],
                                  value: isAC,
                                  onChanged: (value) {
                                    setState(() {
                                      isAC = value!;
                                    });

                                    if (value = true) {
                                      facilities.add(5);
                                    }
                                  },
                                ),
                                CustomText(
                                  size: 12.sp,
                                  text: searchCubit
                                      .listSearch[0].facilities[0].name,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal[400],
                                  value: isWifi,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value = true) {
                                        facilities.add(6);
                                      }
                                      isWifi = value!;
                                    });
                                  },
                                ),
                                CustomText(
                                    size: 12.sp,
                                    text: searchCubit
                                        .listSearch[0].facilities[1].name),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal[400],
                                  value: isSeaView,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value = true) {
                                        facilities.add(9);
                                      }
                                      isSeaView = value!;
                                    });
                                  },
                                ),
                                CustomText(
                                  size: 12.sp,
                                  text: searchCubit
                                      .listSearch[0].facilities[2].name,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.2,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal[400],
                                  value: isKitchen,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value = true) {
                                        facilities.add(10);
                                      }
                                      isKitchen = value!;
                                    });
                                  },
                                ),
                                CustomText(
                                  size: 12.sp,
                                  text: searchCubit
                                      .listSearch[0].facilities[3].name,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.teal[400],
                                  value: isGarden,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value = true) {
                                        facilities.add(7);
                                      }
                                      isGarden = value!;
                                    });
                                  },
                                ),
                                CustomText(
                                  size: 12.sp,
                                  text: searchCubit
                                      .listSearch[6].facilities[2].name,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 2,
                    color: AppColors.greyLight,
                    indent: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Type of Accommodation',
                    color: AppColors.kTextColor1.withOpacity(0.4),
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('All'),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            setState(() {
                              switchAll = value;
                            });
                          },
                          value: switchAll,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greyLight,
                          activeTrackColor: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Apartment'),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            setState(() {
                              switchApartment = value;
                            });
                          },
                          value: switchApartment,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greyLight,
                          activeTrackColor: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Home'),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            setState(() {
                              switchHome = value;
                            });
                          },
                          value: switchHome,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greyLight,
                          activeTrackColor: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Villa'),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            setState(() {
                              switchVilla = value;
                            });
                          },
                          value: switchVilla,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greyLight,
                          activeTrackColor: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('hotel'),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            setState(() {
                              switchHotel = value;
                            });
                          },
                          value: switchHotel,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: AppColors.greyLight,
                          activeTrackColor: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              searchCubit.getSearch(
                  minPrice: values.start,
                  maxPrice: values.end,
                  facilities: facilities);

              Navigator.pop(
                context,
              );
            },
            child: const CustomButton(
              text: 'Apply',
              left: 50,
              right: 50,
              bottom: 20,
              top: 20,
              height: 0.1,
            ),
          ),
        );
      },
    );
  }
}
