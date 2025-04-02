import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:landing_page/helpers/Strings.dart';
import 'package:landing_page/signup.dart';

import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                reverse: true,
                animationFile: 'assets/animations/growingplant.json',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                animationFile: 'assets/animations/weather.json',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                reverse: true,
                animationFile: 'assets/animations/analyzing.json',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
              makePage(
                animationFile: 'assets/animations/community.json',
                title: Strings.stepFourTitle,
                content: Strings.stepFourContent,
              ),
              makePage(
                reverse: true,
                animationFile: 'assets/animations/market.json',
                title: Strings.stepFiveTitle,
                content: Strings.stepFiveContent,
              ),
              makePage(
                animationFile: 'assets/animations/rocket.json',
                title: Strings.stepSixTitle,
                content: Strings.stepSixContent,
                isLastPage: true,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required String animationFile,
    required String title,
    required String content,
    bool reverse = false,
    bool isLastPage = false,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (reverse)
            FadeInUp(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Lottie.asset(animationFile, height: 250),
              ),
            ),
          FadeInUp(
            duration: Duration(milliseconds: 900),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          FadeInUp(
            duration: Duration(milliseconds: 1200),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (!reverse)
            FadeInUp(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Lottie.asset(animationFile, height: 250),
              ),
            ),
          if (isLastPage)
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    return List.generate(6, (index) => _indicator(currentIndex == index));
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
