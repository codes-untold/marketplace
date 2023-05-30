import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint/models/product_model.dart';
import 'package:moniepoint/utils/product_list.dart';
import 'package:moniepoint/utils/styles.dart';
import 'package:moniepoint/views/widgets/product_card.dart';
import 'package:spring/spring.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(this.productData, {super.key});
  final ProductModel productData;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double firstTabOpacityValue = 0.1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        firstTabOpacityValue = 0.9;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0XFF161828),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Color(0XFFE65986),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.share_outlined,
                        color: Color(0XFF161828),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/icon_shop.svg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Spring.slide(
                    animDuration: const Duration(milliseconds: 500),
                    slideType: SlideType.slide_in_bottom,
                    withFade: true,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XFFF0F0F0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Image.asset(
                                  widget.productData.imgPath,
                                  width: 300,
                                ),
                              ),
                              Column(
                                children: [
                                  productImageCard(
                                    widget.productData.imgPath,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  productImageCard(
                                    widget.productData.imgPath,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  productImageCard(
                                    widget.productData.imgPath,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  productImageCard(
                                    widget.productData.imgPath,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Spring.slide(
                    animDuration: const Duration(milliseconds: 500),
                    slideType: SlideType.slide_in_bottom,
                    delay: const Duration(milliseconds: 300),
                    withFade: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.house_siding_outlined,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tokobaju.id',
                              style: AppStyles.semiBoldText.copyWith(
                                  color: Colors.grey.withOpacity(0.7)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.productData.shortDescription,
                          style: AppStyles.extraBoldText.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0XFFFAA23B),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.9 Ratings',
                                  style: AppStyles.boldText.copyWith(
                                      color: Colors.black.withOpacity(0.3),
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 2,
                            ),
                            Text(
                              '2.3k Review',
                              style: AppStyles.boldText.copyWith(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 15),
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 2,
                            ),
                            Text(
                              '2.3k Review',
                              style: AppStyles.boldText.copyWith(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Spring.slide(
                    animDuration: const Duration(milliseconds: 500),
                    slideType: SlideType.slide_in_bottom,
                    delay: const Duration(milliseconds: 500),
                    child: TabBar(
                      labelColor: const Color(0XFF4DAA96),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color(0XFF4DAA96),
                      // padding: EdgeInsets.zero,
                      // labelPadding: EdgeInsets.zero,
                      labelStyle: AppStyles.boldText
                          .copyWith(color: const Color(0XFF4DAA96)),
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          child: Text(
                            'About Items',
                          ),
                        ),
                        Tab(
                          child: Text('Reviews'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customRow('Brand:', 'CHArmkpR'),
                      customRow('Color:', 'Aprikot'),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customRow('Category:', 'Casual Shirt'),
                      customRow('Material:', 'Polyester'),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customRow('Condition:', 'New'),
                      customRow('Heavy:', '200g'),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Description',
                    style: AppStyles.boldText
                        .copyWith(color: const Color(0XFF2B2D40), fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Introducing our trendy and comfortable T-shirt, the perfect addition to your wardrobe! Crafted with care from high-quality '
                    'cotton fabric, this T-shirt ensures a soft and breathable feel throughout the day. The classic crew neck design offers a timeless '
                    'appeal, suitable for any occasion. With its versatile style, you can effortlessly dress it up or down for casual outings or social '
                    'gatherings. Available in a range of vibrant colors and sizes, this T-shirt guarantees a great fit for everyone. Its durable construction '
                    'and excellent print quality make it a long-lasting favorite. Embrace style and comfort with our must-have T-shirt today!',
                    style: AppStyles.semiBoldText.copyWith(
                        color: Colors.grey.withOpacity(0.9), fontSize: 12),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'See less',
                        style: AppStyles.boldText.copyWith(
                            color: const Color(0XFF4DAA96), fontSize: 12),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Shipping Information',
                    style: AppStyles.boldText
                        .copyWith(color: const Color(0XFF2B2D40), fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Delivery:',
                        style: AppStyles.semiBoldText
                            .copyWith(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Shipping from Indonesia',
                        style: AppStyles.boldText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Delivery:',
                        style: AppStyles.semiBoldText
                            .copyWith(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Shipping from Indonesia',
                        style: AppStyles.boldText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Arrive:',
                        style: AppStyles.semiBoldText
                            .copyWith(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Estimated arrival on 25 - 27 2022',
                        style: AppStyles.boldText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Seller Information:',
                    style: AppStyles.boldText
                        .copyWith(color: const Color(0XFF2B2D40), fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            radius: 40,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Thrifting',
                                    style: AppStyles.extraBoldText.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  Text(
                                    'Store',
                                    style: AppStyles.extraBoldText.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              radius: 7,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Thrifting_Store',
                              style: AppStyles.extraBoldText
                                  .copyWith(fontSize: 12, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Active 5 min ago | 96.7% Positive Feedback',
                              style: AppStyles.mediumText
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: const Color(0XFF4DAA96))),
                              child: Row(children: [
                                const Icon(
                                  Icons.house,
                                  size: 15,
                                  color: Color(0XFF4DAA96),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Visit Store',
                                  style: AppStyles.semiBoldText.copyWith(
                                      color: Color(0XFF4DAA96), fontSize: 12),
                                )
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Reviews & Ratings',
                    style: AppStyles.extraBoldText
                        .copyWith(color: const Color(0XFF2B2D40), fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '4.9',
                                    style: AppStyles.extraBoldText
                                        .copyWith(fontSize: 35),
                                  ),
                                  Text(
                                    ' / 5.0',
                                    style: AppStyles.mediumText.copyWith(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star,
                                          color: Color(0XFFFAA23B),
                                          size: 15,
                                        )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '2.3k+ Reviews',
                                style: AppStyles.semiBoldText
                                    .copyWith(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customRatingBar(8, 2, '5', '1.5k'),
                                customRatingBar(7, 3, '4', '710'),
                                customRatingBar(6, 4, '3', '140'),
                                customRatingBar(5, 5, '2', '10'),
                                customRatingBar(4, 6, '1', '4'),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Recommendation',
                    style: AppStyles.extraBoldText
                        .copyWith(color: const Color(0XFF2B2D40), fontSize: 15),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
              ]),
            )),
            bottomBar()
          ],
        ),
      ),
    );
  }

  Widget productImageCard(String imgPath) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      child: Image.asset(
        imgPath,
        width: 30,
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: AppStyles.mediumText.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '\$12.00',
                style: AppStyles.extraBoldText
                    .copyWith(color: const Color(0XFF4DAA96), fontSize: 17),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  color: const Color(0XFF4DAA96),
                  child: Center(
                    child: Row(children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '1',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      )
                    ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  color: const Color(0XFF2B2D40),
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: AppStyles.boldText.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customRow(String text1, String text2) {
    return Row(
      children: [
        Text(
          text1,
          style: AppStyles.semiBoldText.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text2,
          style: AppStyles.boldText.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget customRatingBar(
      int flex1, int flex2, String ratingValue, String ratingNumber) {
    return Row(children: [
      const Icon(
        Icons.star,
        color: Color(0XFFFAA23B),
        size: 12,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        ratingValue,
        style: AppStyles.mediumText.copyWith(color: Colors.grey),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 7,
            child: Row(children: [
              Expanded(
                flex: flex1,
                child: Container(
                  color: const Color(0XFF4DAA96),
                  height: 7,
                ),
              ),
              Expanded(
                flex: flex2,
                child: Container(
                  color: Colors.grey.shade200,
                  height: 7,
                ),
              ),
            ]),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        ratingNumber,
        style: AppStyles.boldText.copyWith(color: const Color(0XFF2B2D40)),
      )
    ]);
  }
}
