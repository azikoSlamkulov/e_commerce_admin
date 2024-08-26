import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/util/app_constants/text_styles/app_text_styles.dart';
import '../../../../config/util/app_widgets/app_rating_bar_indicator.dart';
import '../../domain/entities/product_entity.dart';
import '../views/mobile/mobole_product_datail_view.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({
    super.key,
    required this.product,
    //required this.onTap,
    this.favoriteOnTap,
    //required this.isSale,
    //this.sizedHeight = 220,
    //this.sizedWidth = 140,
  });

  final ProductEntity product;
  //final VoidCallback onTap;
  final VoidCallback? favoriteOnTap;
  //final bool isSale;
  //final double sizedWidth;
  //final double sizedHeight;

  @override
  Widget build(BuildContext context) {
    //final bool isNew = DateTimeFormatter().isNew(product.createdDate!);

    return InkWell(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => MobileProductDatailView(product: product),
      //   ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            child: Stack(
              children: [
                ///Image
                Container(
                  height: 192.h, // 184.h
                  decoration: BoxDecoration(
                    //color: Colors.greenAccent,
                    image: DecorationImage(
                      image: NetworkImage(product.imgUrl!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),

                ///Round text
                Positioned(
                  top: 10.h,
                  left: 10.h,
                  child: product.isSale! || product.isNew!
                      ? Container(
                          padding: REdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: product.isSale! ? Colors.red : Colors.black,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            product.isSale! ? '-${product.sale}%' : 'New',
                            style: AppTextStyles.white11,
                          ),
                        )
                      : const SizedBox(),
                ),

                /// Favorite button
                // Positioned(
                //   bottom: 8.h,
                //   right: -14.h,
                //   // child: FavoriteToggleIconBtn(
                //   //     //isFavorite: product.isFavorite!),
                //   //     isFavorite: false);

                //   child: FavoriteButtonWidget(productID: product.productID!),
                // ),

                /// Rating
                Positioned(
                  bottom: 0.h,
                  left: -1.h,
                  child: AppRatingBarIndicator(
                    totalRating: product.totalRating!,
                    totalUser: product.totalUser!,
                    itemSize: 16.h,
                    textStyle: AppTextStyles.grey10,
                  ),
                ),
              ],
            ),
          ),

          ///Brand
          5.verticalSpace,
          Text(
            product.brand!,
            style: AppTextStyles.grey11,
          ),

          ///Item
          5.verticalSpace,
          Text(
            product.category!.categoryName!,
            style: AppTextStyles.black16Bold,
          ),

          ///Prise
          5.verticalSpace,
          !product.isSale!
              ? Text(
                  '\$${product.price}',
                  style: AppTextStyles.black14Bold,
                )
              : Row(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                    5.horizontalSpace,
                    Text(
                      '\$${product.newPrice}',
                      style: AppTextStyles.red14Bold,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
