import 'package:booking_app/app/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:booking_app/app/auth/presentation/controller/cubit/auth_state.dart';
import 'package:booking_app/app/auth/presentation/screens/sign_in_screen.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:booking_app/home_Screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BBGwColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
                content: CustomText(
                  text: state.messageApi,
                  color: Colors.white,
                  size: 14,
                )));
          } else if (state is RegisterLoadedState) {
            FocusManager.instance.primaryFocus?.unfocus();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: const Color(0xff4FBE9E),
                duration: const Duration(seconds: 2),
                content: CustomText(
                  text: state.message,
                  color: Colors.white,
                  size: 14,
                )));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeLayOut()));
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Sign up',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 45,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60.0)),
                              color: Color(0xff3F51B5),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/fb_icon.png',
                                    height: 35,
                                  ),
                                  const CustomText(
                                    size: 15,
                                    text: 'Facebook',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 45,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60.0)),
                              color: Color(0xff2CA7E0),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/twitter.png',
                                    height: 35,
                                    width: 35,
                                  ),
                                  const CustomText(
                                    text: 'Twitter',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                      child: CustomText(
                    size: 14,
                    text: 'or log in with email',
                    color: AppColors.BGreyTextColor,
                  )),
                  const SizedBox(height: 10),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: CustomText(
                            text: 'FirstName',
                            size: 12,
                            color: AppColors.BGreyTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: fNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter first name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: 'Enter your first name',
                              hintStyle: const TextStyle(
                                  color: AppColors.BGreyTextColor,
                                  fontSize: 14)),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: CustomText(
                            text: 'LastName',
                            size: 12,
                            color: AppColors.BGreyTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: lNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter last name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: 'Enter your last name',
                              hintStyle: const TextStyle(
                                  color: AppColors.BGreyTextColor,
                                  fontSize: 14)),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: CustomText(
                            text: 'Your email',
                            size: 12,
                            color: AppColors.BGreyTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter email';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: 'Enter your email',
                              hintStyle: const TextStyle(
                                  color: AppColors.BGreyTextColor,
                                  fontSize: 14)),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: CustomText(
                            text: 'Your password',
                            size: 12,
                            color: AppColors.BGreyTextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter password';
                            }
                            return null;
                          },
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25)),
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(
                                  color: AppColors.BGreyTextColor,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  state is RegisterLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          height: 45,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4FBE9E),
                              borderRadius: BorderRadius.circular(20)),
                          child: MaterialButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (formKey.currentState!.validate()) {
                                String name =
                                    fNameController.text + lNameController.text;
                                cubit.register(
                                    name: name,
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: const CustomText(
                              text: 'Sign up',
                              color: Colors.white,
                            ),
                          ),
                        ),
                  const SizedBox(height: 30),
                  const Center(
                    child: CustomText(
                      text:
                          'by signing up,you agreed with our terms of \n services and privacy policy',
                      color: Color(0xff555555),
                      size: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        size: 14,
                        text: 'you have already an acount ? ',
                        color: Color(0xff555555),
                      ),
                      TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: const CustomText(
                            text: 'Log in',
                            size: 14,
                          ))
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
