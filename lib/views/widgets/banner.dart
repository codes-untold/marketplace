import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/utils/styles.dart';

class BannerCarousel extends StatefulWidget {
  BannerCarousel(this.pageIndex, {super.key});
  Function(int) pageIndex;
  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final List<String> imgList = const [
    "assets/images/banner_img1.png",
    "assets/images/banner_img2.png"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            widget.pageIndex(index);
            setState(() {
              selectedIndex = index;
            });
          },
          autoPlay: true,
          //  height: 200.0,
          aspectRatio: 1,
          viewportFraction: 1.0,
        ),
        items: List.generate(
            imgList.length,
            (index) => Builder(builder: (context) {
                  return Stack(
                    children: [
                      Container(
                        color: _getBannerColor(index),
                        width: double.infinity,
                        //  height: 250,
                        child: FractionallySizedBox(
                          heightFactor: _getBannerHeightFactor(index),
                          widthFactor: _getBannerWidthFactor(index),
                          child: Image.asset(
                            imgList[index],
                            width: _getBannerWidth(index, context),
                            height: _getBannerHeight(index, context),
                            alignment: Alignment
                                .bottomRight, // Align the image to the top-left corner
                            fit: BoxFit
                                .fill, // Fill the specified width and height

                            frameBuilder: (BuildContext context, Widget child,
                                int? frame, bool wasSynchronouslyLoaded) {
                              if (frame == null) {
                                return child;
                              }
                              return ClipRect(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 40,
                        child: Row(
                          children: [
                            selectedIndex == 0
                                ? selectedBanner()
                                : unSelectedBanner(),
                            const SizedBox(
                              width: 5,
                            ),
                            selectedIndex == 1
                                ? selectedBanner()
                                : unSelectedBanner(),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#FASHION DAY',
                              style: AppStyles.boldText,
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              '80% Off',
                              style: AppStyles.extraBoldText
                                  .copyWith(fontSize: 25),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              'Discover fashion that suits \nto your style',
                              style: AppStyles.lightText.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0XFF2B2D40)),
                          child: Text(
                            'Check this out',
                            style: AppStyles.boldText
                                .copyWith(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  );
                })));
  }

  double _getBannerWidth(int index, BuildContext context) {
    if (index == 0) {
      return MediaQuery.of(context).size.width * 1.1;
    } else {
      return MediaQuery.of(context).size.width * 0.9;
    }
  }

  double _getBannerHeight(int index, BuildContext context) {
    if (index == 0) {
      return MediaQuery.of(context).size.width * 1.1;
    } else {
      return MediaQuery.of(context).size.width * 0.9;
    }
  }

  Color _getBannerColor(int index) {
    if (index == 0) {
      return const Color(0XFFE8EBEA);
    } else {
      return const Color(0XFFE8E0E1);
    }
  }

  double _getBannerWidthFactor(int index) {
    if (index == 0) {
      return 2.0;
    } else {
      return 1.8;
    }
  }

  double _getBannerHeightFactor(int index) {
    if (index == 0) {
      return 2.6;
    } else {
      return 1.4;
    }
  }

  Widget selectedBanner() {
    return Container(
      width: 15,
      height: 5,
      decoration: BoxDecoration(
          color: const Color(0XFF161828),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget unSelectedBanner() {
    return CircleAvatar(
      radius: 2,
      backgroundColor: Colors.grey.shade400,
    );
  }
}
