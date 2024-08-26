import 'dart:developer';

import 'package:e_commerce_admin/src/config/locator.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/buttons/custom_button.dart';
import 'package:e_commerce_admin/src/module/orders/presentation/cubit/orders_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TestView extends StatelessWidget {
//   const TestView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log('Build - 1');
//     return BlocProvider<OrdersCubit>(
//       create: (context) => sl<OrdersCubit>()..getOrdersInfo(),
//       child: BlocBuilder<OrdersCubit, OrdersState>(
//         builder: (context, state) {
//           if (state is LoadingOrdersState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is LoadedOrderInfoState) {
//             // final delivired =
//             //     state.allOrders.where((i) => i.status == 'delivered').toList();
//             // final processing =
//             //     state.allOrders.where((i) => i.status == 'processing').toList();
//             // final cancelled =
//             //     state.allOrders.where((i) => i.status == 'cancelled').toList();
//             return NestedTestView(
//                 //allOrders: state.allOrders,

//                 // delivired: delivired,
//                 // processing: processing,
//                 // cancelled: cancelled,
//                 );
//           } else if (state is FailureOrderState) {
//             //return MyErrorWidget('${state.exception}');
//             return Text('');
//           } else {
//             //return const SomeError();,
//             return Text('');
//           }
//         },
//       ),
//     );
//   }
// }

class TestView extends StatelessWidget {
  const TestView({
    super.key,
  });
  static final testFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sizeTextController = TextEditingController();

    log('build - 1');
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Test',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          Form(
            key: testFormKey,
            child: TextFormField(
              controller: sizeTextController,
            ),
            // child: CustomTextFormField(
            //   controller: priseCtrl,
            //   keyboardType: TextInputType.number,
            //   sizedBoxHeight: 40.h,
            //   //sizedBoxWidth: MediaQuery.of(context).size.width,
            //   labelText: 'Enter prise',
            // ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
        height: 112.h,
        color: Colors.white,
        child: CustomButton(
          text: 'Ok',
          onPressed: () {
            log('Colors ====>>>>>> ${sizeTextController.text}');
          },
        ),
      ),
    );
  }
}
