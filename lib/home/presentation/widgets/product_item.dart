import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_page/home/data/models/ProductsModel.dart';
import 'package:task_page/core/utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductsModel? productModel;

  const ProductItem({
    required this.index,
    required this.productModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var product = productModel?.products?[index];
    return Padding(
      padding: EdgeInsets.only(
          left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 2.w, color: Colors.blueGrey)),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: product?.images?.first ?? "",
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 191.h,
                          errorWidget: (context, url, error) =>
                          const Center(child: CircularProgressIndicator())),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(2.h.w),
                          margin: EdgeInsets.only(left: 6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: AppColors.BlueColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text(
                        product?.title?[index]?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Nike Air Jordan"),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8.w),
                        Text(product?.price.toString() ?? ""),
                        SizedBox(width: 10.w),
                        const Text("EGP 1200"),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Spacer(),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                      child: Row(
                        children: [
                          const Text("Review"),
                          SizedBox(width: 4.w),
                          Text(product?.rating.toString() ?? ""),
                          SizedBox(width: 4.w),
                          const Text("(4.5)"),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: EdgeInsets.all(5.w.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: AppColors.BlueColor,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
