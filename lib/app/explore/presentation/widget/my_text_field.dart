import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.teal,
        ),
        contentPadding: EdgeInsets.only(left: 0.5.h),
        enabled: false,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Where are you going?',
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.1),
            borderRadius: BorderRadius.all(Radius.circular(5.h))),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.1),
            borderRadius: BorderRadius.all(Radius.circular(5.h))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.1),
            borderRadius: BorderRadius.all(Radius.circular(5.h))),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.1),
            borderRadius: BorderRadius.all(Radius.circular(5.h))),
      ),
    );
  }
}
