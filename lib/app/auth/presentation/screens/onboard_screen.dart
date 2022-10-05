import 'package:booking_app/app/auth/presentation/screens/sign_in_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final pageController = PageController();
  final List<PageViewModel> pages = [
    PageViewModel('assets/images/World-pana.png', 'Plan your trips',
        'Book one of your unique hotel to escape the ordinary'),
    PageViewModel('assets/images/Search-amico.png', 'Find best deals',
        'Find deals for any season from cosy country homes to city flats'),
    PageViewModel(
      'assets/images/Airport-pana.png',
      'Best travelling all time',
      'Find deals for any season from cosy country homes to city flats',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return buidPageView(pages[index]);
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                effect: WormEffect(
                    dotColor: Colors.grey.shade300,
                    activeDotColor: const Color(0xff4FBE9E),
                    dotWidth: 18,
                    dotHeight: 6),
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  color: Colors.teal,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  color: Colors.grey,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: const Text(
                    "Create account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget buidPageView(PageViewModel page) => Column(
        children: [
          Image.asset(
            page.image,
          ),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            page.description,
            style: const TextStyle(
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          )
        ],
      );
}

class PageViewModel {
  final String image;
  final String title;
  final String description;

  PageViewModel(this.image, this.title, this.description);
}
