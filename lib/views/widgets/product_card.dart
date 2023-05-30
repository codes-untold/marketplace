import 'package:flutter/material.dart';
import 'package:moniepoint/models/product_model.dart';
import 'package:moniepoint/utils/styles.dart';
import 'package:moniepoint/views/screens/product_detail.dart';
import 'package:page_transition/page_transition.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.productData, {super.key});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: ProductDetailScreen(productData)));
      },
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    width: double.infinity,
                    color: const Color(0XFFF0F0F0),
                    child: Image.asset(productData.imgPath)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: productData.isFavourite
                      ? const Icon(
                          Icons.favorite,
                          color: Color(0XFFE65986),
                        )
                      : const Icon(Icons.favorite_outline),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productData.productName,
                        style: AppStyles.boldText
                            .copyWith(color: Colors.black.withOpacity(0.3)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productData.shortDescription,
                        style: AppStyles.extraBoldText.copyWith(
                            color: Colors.black.withOpacity(0.8), fontSize: 13),
                      )
                    ],
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
                            '4.9',
                            style: AppStyles.boldText.copyWith(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        '\$${productData.price}',
                        style: AppStyles.extraBoldText.copyWith(
                            color: const Color(0XFF4DAA96), fontSize: 17),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
