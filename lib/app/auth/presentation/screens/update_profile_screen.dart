import 'package:booking_app/app/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/app/auth/presentation/controller/cubit/auth_state.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController(text: '+65 1122334455');
  var dateOfBrithController = TextEditingController(text: '20, Aug, 1990');
  var addressController =
      TextEditingController(text: '123 Royal Street,New York ');
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        var cubit = AuthCubit.get(context);
        if (state is UpdateProfileLoadedState) {
          cubit.resetPicker();
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        nameController.text = cubit.profileInfo!.name;
        emailController.text = cubit.profileInfo!.email;
        String? image = cubit.profileInfo!.image!;

        print('rebuild');

        return Scaffold(
          backgroundColor: AppColors.BBGwColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  cubit.resetPicker();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            actions: [
              TextButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      if (cubit.profileInfo!.name != nameController.text ||
                          cubit.profileInfo!.email != emailController.text) {
                        cubit.updateProfileInfo(
                          name: nameController.text,
                          email: emailController.text,
                        );
                      }
                    }
                  },
                  child: const CustomText(text: 'update', color: Colors.teal)),
              const SizedBox(width: 10),
            ],
            backgroundColor: AppColors.BBGwColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is UpdateProfileLoadingState)
                      const LinearProgressIndicator(),
                    const CustomText(
                      text: 'Edit Profile',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      size: 22,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          (cubit.profileImagePicker == null
                              ? Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 12.h,
                                  width: 12.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      fit: BoxFit.cover,
                                      imageUrl: image !=
                                              'http://api.mahmoudtaha.com/images'
                                          ? image
                                          : 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=740&t=st=1664130177~exp=1664130777~hmac=6fb3300de9be4e9d8efe39225fe542246ea25cd847fc684ac82af0efb013dde2'),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      FileImage(cubit.profileImagePicker!),
                                )),
                          InkWell(
                            onTap: () {
                              cubit.getImagePicker();
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 20,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (cubit.profileImagePicker != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: TextButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                cubit.updateProfileInfo(
                                    name: nameController.text,
                                    email: emailController.text,
                                    image: cubit.profileImagePicker);
                              },
                              child: const CustomText(
                                text: 'Upload Image',
                                color: Colors.teal,
                                size: 16,
                              )),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const CustomText(
                          text: 'UserName',
                          size: 14,
                          color: AppColors.BGreyTextColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: nameController,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.teal,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CustomText(
                          text: 'Email',
                          size: 14,
                          color: AppColors.BGreyTextColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.teal,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CustomText(
                          text: 'Phone',
                          size: 14,
                          color: AppColors.BGreyTextColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: phoneController,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.teal,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CustomText(
                          text: 'Date of Brith',
                          size: 14,
                          color: AppColors.BGreyTextColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: dateOfBrithController,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CustomText(
                          text: 'Address',
                          size: 14,
                          color: AppColors.BGreyTextColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: addressController,
                            textAlign: TextAlign.right,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      height: 1,
                      thickness: 1.2,
                      color: AppColors.BGreyIconColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
