import 'dart:math';

import 'package:flutter/material.dart';
import 'package:caffeine/styles/colors.dart';
import 'package:caffeine/styles/textstyles.dart';
import 'package:caffeine/utils/app_screen_utils.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  // Example items for the carousel
  List<Map<String, String>> items = [
    {'title': 'Caramel Hazelnut Iced Coffee'},
    {'title': 'Iced Vanilla Almond Milk Latte'},
    {'title': 'American Iced Thai Coffee'}
  ];

  List<Map<String, String>> details = [
    {
      'title': 'Caramel Hazelnut Iced Coffee',
      'Desc':
          'Caramel Hazelnut Iced Coffee is a luxurious blend of rich, bold coffee cooled to perfection and flavored with the nutty essence of hazelnut and the sweet, buttery taste of caramel.',
      'imgUrl': 'assets/images/caramel_hazelnut.png'
    },
    {
      'title': 'Iced Vanilla Almond Milk Latte',
      'Desc':
          'The Iced Vanilla Almond Milk Latte is a refreshing, dairy-free alternative to the classic iced latte. Perfect for warm weather or whenever you desire a cool.',
      'imgUrl': 'assets/images/iced_vannila.png'
    },
    {
      'title': 'American Iced Thai Coffee',
      'Desc':
          'American Thai Tea is a delightful fusion of traditional Thai Coffee and classic American Coffee-drinking culture. ',
      'imgUrl': 'assets/images/american_iced.png'
    }
  ];

  // Navigate to the next page
  void _nextPage() {
    if (currentIndex < items.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Navigate to the previous page
  void _previousPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Method to show a dialog with details
  void _showDetailsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool isLiked = false;
        bool isDisliked = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                  backgroundColor: Colors.black,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.87,
                    padding: EdgeInsets.fromLTRB(28, 17, 28, 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                details[index]['imgUrl']!,
                                width: double.infinity,
                                height: AppScreenUtil().screenHeight(230),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: AppScreenUtil().screenHeight(15)),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              details[index]['title']!,
                              style: detailTextStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: AppScreenUtil().screenHeight(10)),
                          Text(
                            details[index]['Desc']!,
                            style: subDetailTextStyle,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(height: AppScreenUtil().screenHeight(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLiked = true;
                                    isDisliked = false;
                                  });
                                },
                                child: Image.asset(
                                  'assets/images/like.png',
                                  height: AppScreenUtil().screenHeight(20),
                                  width: AppScreenUtil().screenWidth(25),
                                  color: isLiked ? Colors.blue : Colors.white,
                                ),
                              ),
                              SizedBox(width: AppScreenUtil().screenWidth(15)),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDisliked = true;
                                    isLiked = false;
                                  });
                                },
                                child: Image.asset(
                                  'assets/images/dislike.png',
                                  height: AppScreenUtil().screenHeight(20),
                                  width: AppScreenUtil().screenWidth(25),
                                  color:
                                      isDisliked ? Colors.blue : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 32,
                  top: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: whiteColor,
                      size: 15,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 40, 25, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: AppScreenUtil().screenHeight(103),
                  width: AppScreenUtil().screenWidth(120),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Left rotated container
                      Transform.rotate(
                        angle: pi / 2.5, // Rotate left
                        child: Transform.translate(
                          offset: Offset(0, 7),
                          child: Container(
                            width: 115,
                            height: 120,
                            decoration: BoxDecoration(
                              color: whiteColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: -pi / 2.5, // Rotate right
                        child: Transform.translate(
                          offset: Offset(0, 7),
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            width: 115,
                            height: 120,
                          ),
                        ),
                      ),
                      // PageView for the carousel
                      PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _showDetailsDialog(context, index),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 18),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index]['title']!,
                                    style: headTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Left arrow
                      Positioned(
                        bottom: 3,
                        left: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: blackColor,
                            size: 15,
                          ),
                          onPressed: _previousPage,
                        ),
                      ),

                      // Right arrow
                      Positioned(
                        bottom: 3,
                        right: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 15,
                          ),
                          onPressed: _nextPage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
