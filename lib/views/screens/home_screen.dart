import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint/utils/product_list.dart';
import 'package:moniepoint/utils/styles.dart';
import 'package:moniepoint/views/widgets/banner.dart';
import 'package:moniepoint/views/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              expandedHeight: screenSize.height * 0.45,
              elevation: 0,
              pinned: true,
              leadingWidth: MediaQuery.of(context).size.width,
              title: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search..",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.search),
                          ),
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.only(top: 15),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xffD2D5D8), width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xffD2D5D8), width: 1.0))),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/icon_message.svg',
                          ),
                          SvgPicture.asset(
                            'assets/icons/icon_shop.svg',
                          ),
                        ],
                      ))
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                      width: double.infinity, child: BannerCarousel()))),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCard(
                          Icons.auto_awesome_mosaic_outlined, 'Category'),
                      customCard(Icons.flight_sharp, 'Flight'),
                      customCard(Icons.assignment_outlined, 'Bill'),
                      customCard(Icons.public, 'Data Plan'),
                      customCard(Icons.category_outlined, 'Top Up'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15,
                          height: 5,
                          decoration: BoxDecoration(
                              color: const Color(0XFF161828),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.grey.shade400,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.grey.shade400,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            toolbarHeight: 40,
            backgroundColor: const Color(0XFFF6F6F6),
            title: Container(
              color: const Color(0XFFF6F6F6),
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Sale Product',
                        style: AppStyles.boldText.copyWith(fontSize: 18),
                      ),
                      Text(
                        'See More',
                        style: AppStyles.semiBoldText.copyWith(
                            fontSize: 14, color: const Color(0XFF4DAA96)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(productList[index]);
                },
                childCount: productList.length, // Number of grid items
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customCard(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            icon,
            color: const Color(0XFF737680),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style:
              AppStyles.semiBoldText.copyWith(color: const Color(0XFFB5B5B5)),
        )
      ],
    );
  }
}
