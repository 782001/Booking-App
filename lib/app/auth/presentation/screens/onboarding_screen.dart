// import 'package:booking_app/app/auth/presentation/screens/sign_in_screen.dart';
// import 'package:booking_app/app/auth/presentation/screens/sign_up_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:onboarding/onboarding.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late Material materialButton;
//   late int index;
//   final onboardingPagesList = [
//     PageModel(
//       widget: DecoratedBox(
//         decoration: const BoxDecoration(
//           color: Colors.transparent,
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                 ),
//                 child: Image.asset(
//                   'assets/images/World-pana.png',
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Plan your trips',
//                     style: TextStyle(
//                       fontSize: 23.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Book one of your unique hotel to escape the ordinary',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       letterSpacing: 0.7,
//                       height: 1.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: const BoxDecoration(
//           color: Colors.transparent,
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                 ),
//                 child: Image.asset(
//                   'assets/images/Search-amico.png',
//                   height: 250.0,
//                 ),
//               ),
//               const SizedBox(
//                 height: 80,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Find best deals',
//                     style: TextStyle(
//                       fontSize: 23.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Find deals for any season from cosy country homes to city flats',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       letterSpacing: 0.7,
//                       height: 1.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: const BoxDecoration(
//           color: Colors.transparent,
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                 ),
//                 child: Image.asset(
//                   'assets/images/Airport-pana.png',
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Best travelling all time',
//                     style: TextStyle(
//                       fontSize: 23.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Find deals for any season from cosy country homes to city flats',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       letterSpacing: 0.7,
//                       height: 1.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     index = 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(top: 100),
//           child: Onboarding(
//             pages: onboardingPagesList,
//             onPageChange: (int pageIndex) {
//               index = pageIndex;
//             },
//             startPageIndex: 0,
//             footerBuilder: (context, dragDistance, pagesLength, setIndex) {
//               return ColoredBox(
//                 color: Colors.transparent,
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 90.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomIndicator(
//                               netDragPercent: dragDistance,
//                               pagesLength: pagesLength,
//                               shouldPaint: true,
//                               indicator: Indicator(
//                                 activeIndicator: const ActiveIndicator(
//                                     color: Colors.grey, borderWidth: 7),
//                                 closedIndicator: const ClosedIndicator(
//                                     color: Colors.teal, borderWidth: 7),
//                                 indicatorDesign: IndicatorDesign.line(
//                                   lineDesign: LineDesign(
//                                     lineType: DesignType.line_nonuniform,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 45,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(60.0)),
//                           color: Colors.teal,
//                         ),
//                         child: MaterialButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginScreen()));
//                           },
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 45,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(60.0)),
//                           color: Colors.grey,
//                         ),
//                         child: MaterialButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => RegisterScreen()));
//                           },
//                           child: const Text(
//                             "Create account",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
