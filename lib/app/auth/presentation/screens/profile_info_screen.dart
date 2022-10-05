import 'package:booking_app/app/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/app/auth/presentation/controller/cubit/auth_state.dart';
import 'package:booking_app/app/auth/presentation/screens/update_profile_screen.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileErrorState) {
          return Center(
            child: Text(
              statusProfileInfo != null
                  ? statusProfileInfo!.message
                  : state.message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.BBGwColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateProfileScreen(),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: cubit.profileInfo!.name,
                                color: Colors.black,
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(height: 5),
                              const CustomText(
                                text: 'View and Edit profile',
                                color: AppColors.BGreyTextColor,
                                size: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          // CircleAvatar(
                          //   radius: 37,
                          //   backgroundImage: NetworkImage(cubit
                          //                   .profileInfo!.image !=
                          //               null &&
                          //           cubit.profileInfo!.image !=
                          //               'http://api.mahmoudtaha.com/images'
                          //       ? cubit.profileInfo!.image!
                          //       : 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=740&t=st=1664130177~exp=1664130777~hmac=6fb3300de9be4e9d8efe39225fe542246ea25cd847fc684ac82af0efb013dde2'),
                          // )
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 12.h,
                            width: 12.h,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: CachedNetworkImage(
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                fit: BoxFit.cover,
                                imageUrl: cubit.profileInfo!.image != null &&
                                        cubit.profileInfo!.image !=
                                            'http://api.mahmoudtaha.com/images'
                                    ? cubit.profileInfo!.image!
                                    : 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=740&t=st=1664130177~exp=1664130777~hmac=6fb3300de9be4e9d8efe39225fe542246ea25cd847fc684ac82af0efb013dde2'),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Change Password',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.lock,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Invite Friend',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.people,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Crdit & Coupons',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.card_giftcard,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Help Center',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.info,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Payment',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.payment,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Settings',
                          color: Colors.black,
                          size: 14,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              size: 25,
                              color: AppColors.BGreyIconColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
