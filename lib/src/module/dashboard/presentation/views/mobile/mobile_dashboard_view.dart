import 'dart:developer';

import 'package:e_commerce_admin/src/config/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce_admin/src/config/util/app_widgets/bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../config/locator.dart';
import '../../../../../config/util/app_widgets/range_slider.dart';
import '../../../../orders/domain/entities/order_entity.dart';
import '../../../../orders/domain/entities/order_info_entity.dart';
import '../../../../orders/presentation/cubit/orders_cubit.dart';
import '../../../../../config/util/app_widgets/progress/progress_line.dart';
import '../../../../test/orders_pie_chart.dart';
import '../../widgets/top_selling_pie_chart.dart';

class MobileDashbordView extends StatelessWidget {
  const MobileDashbordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Build - 1');
    return BlocProvider<OrdersCubit>(
      create: (context) => sl<OrdersCubit>()..getOrdersInfo(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is LoadingOrdersState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedOrderInfoState) {
            // final delivired =
            //     state.allOrders.where((i) => i.status == 'delivered').toList();
            // final processing =
            //     state.allOrders.where((i) => i.status == 'processing').toList();
            // final cancelled =
            //     state.allOrders.where((i) => i.status == 'cancelled').toList();
            return NestedDashbordView(
              //allOrders: state.allOrders,
              chartData: state.orderInfo,
              // delivired: delivired,
              // processing: processing,
              // cancelled: cancelled,
            );
          } else if (state is FailureOrderState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedDashbordView extends StatelessWidget {
  const NestedDashbordView({
    super.key,
    //required this.allOrders,
    required this.chartData,
    // required this.delivired,
    // required this.processing,
    // required this.cancelled,
  });

  //final List<OrderEntity> allOrders;
  final List<OrderInfoEntity> chartData;
  // final List<OrderEntity> delivired;
  // final List<OrderEntity> processing;
  // final List<OrderEntity> cancelled;

  @override
  Widget build(BuildContext context) {
    log('build - 2');
    final allorders = chartData[0];
    final packaging = chartData[2];
    final delivered = chartData[1];
    final cancelled = chartData[3];
    final sizeTextController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: 'Dashboard'),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: sizeTextController,
            ),
            // Row(
            //   children: [
            //     buildOrderStatus(
            //       orderInfo: allorders,
            //       // title: 'All Orders',
            //       // width: 0,
            //       // color: Colors.red,
            //       // iconColor: Colors.red,
            //       // textColor: Colors.red,
            //       maxCount: allorders.quantity!,
            //       // percentage: 6,
            //     ),
            //     16.horizontalSpace,
            //     buildOrderStatus(
            //       orderInfo: packaging,
            //       // title: packaging.title!,
            //       // width: 100,
            //       // color: Colors.green,
            //       // iconColor: Colors.green,
            //       // textColor: Colors.yellow,
            //       maxCount: allorders.quantity!,
            //       // percentage: packaging.percentage!,
            //     ),
            //   ],
            // ),
            // 16.verticalSpace,
            // Row(
            //   children: [
            //     buildOrderStatus(
            //       orderInfo: delivered,
            //       // title: delivered.title!,
            //       // width: 20,
            //       // color: Colors.blue,
            //       // iconColor: Colors.blue,
            //       // textColor: Colors.blue,
            //       maxCount: allorders.quantity!,
            //       // percentage: delivered.percentage!,
            //     ),
            //     16.horizontalSpace,
            //     buildOrderStatus(
            //       orderInfo: cancelled,
            //       // title: cancelled.title!,
            //       // width: 50,
            //       // color: Colors.red,
            //       // iconColor: Colors.red,
            //       // textColor: Colors.green,
            //       maxCount: allorders.quantity!,
            //       // percentage: cancelled.percentage!,
            //     ),
            //   ],
            // ),
            // 16.verticalSpace,
            // buildStatus(chartData: chartData, isOrderStatus: true),
            // 16.verticalSpace,
            // buildStatus(chartData: chartData, isOrderStatus: false),
          ],
        ),
      ),
    );
  }

  Widget buildOrderStatus({
    required OrderInfoEntity orderInfo,
    // required String title,
    // required double width,
    // required Color color,
    // required Color iconColor,
    // required Color textColor,
    required int maxCount,
    // required int percentage,
  }) {
    return Expanded(
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderInfo.title!,
                    style: AppTextStyles.black18Bold,
                  ),
                  buildOrderIcon(
                    iconColor: orderInfo.color!,
                    count: orderInfo.quantity!,
                    textColor: orderInfo.color!,
                  ),
                ],
              ),
              20.verticalSpace,
              orderInfo.title == 'All orders'
                  ? const SizedBox(
                      height: 8,
                    )
                  : ProgressLine(
                      maxCount: maxCount,
                      percentage: orderInfo.quantity!,
                      color: orderInfo.color!,
                    )
              //container1(width, color),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildOrderStatus2({
  //   required String title,
  //   required double width,
  //   required Color color,
  // }) {
  //   return Expanded(
  //     child: Card(
  //       child: ListTile(
  //         title: Text(title),
  //         subtitle: container1(width, color),
  //         trailing: buildOrderIcon(),
  //       ),
  //     ),
  //   );
  // }

  Widget buildStatus(
      {required List<OrderInfoEntity> chartData, required bool isOrderStatus}) {
    return Expanded(
      child: Center(
        child: Container(
          //height: 110.h,
          decoration: BoxDecoration(
            color: Colors.white,
            // image: DecorationImage(
            //   image: NetworkImage(product.imgUrl!),
            //   fit: BoxFit.cover,
            // ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: isOrderStatus == true
              ? OrdersPieChart(chartDataList: chartData)
              : const TopSellingPieChart(),
        ),
      ),
    );
  }

  Widget buildOrderIcon({
    required Color iconColor,
    required Color textColor,
    required int count,
  }) {
    return Container(
      height: 25.h,
      width: 30.h,
      decoration: BoxDecoration(
        color: iconColor,
        // image: DecorationImage(
        //   image: NetworkImage(product.imgUrl!),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
