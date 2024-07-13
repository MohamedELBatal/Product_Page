import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_page/config.dart';
import 'package:task_page/core/enums/enums.dart';
import 'package:task_page/home/presentation/bloc/home_bloc.dart';
import 'package:task_page/home/presentation/widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  static const String routeName = "products";

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<HomeBloc>()
      ..add(const GetProductsEvent()),
    child: BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 83.w,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset('assets/images/route.svg'),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF06004E),
                          ),
                          hintText: 'what do you search for?',
                          hintStyle: TextStyle(
                            color: const Color(0x9906004E),
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Badge(
                      label: Text(state.cartItems.toString()),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30.0.sp,
                        color: const Color(0xff004182),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: state.productsModel?.products?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (192 / 250),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w),
                itemBuilder: (context, index) {
                  return ProductItem(
                      productModel: state.productsModel, index: index);
                },
              ),
            ),
          ],
        ),
      );
    }));
  }
}
