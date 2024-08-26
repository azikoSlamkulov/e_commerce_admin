import 'dart:developer';

import 'package:flutter/material.dart';

import '../../module/orders/data/models/order_model.dart';
import '../../module/orders/domain/entities/order_info_entity.dart';

class ServerImitation {
  List<OrderInfoEntity> getOrdersStatus(List<OrderModel> allOrders) {
    List<OrderInfoEntity> orderInfoList = [];

    /// All orders
    final orders = OrderInfoEntity(
      id: 1,
      title: 'All orders',
      quantity: allOrders.length,
      color: Colors.red,
      percentage: 0,
    );

    orderInfoList.add(orders);

    /// Delivered
    final deliveredQuantity =
        allOrders.where((i) => i.status == 'delivered').length;

    final deliveredPercentage =
        (deliveredQuantity / allOrders.length * 100).toInt();

    final delivered = OrderInfoEntity(
      id: 1,
      title: 'Delivered',
      quantity: deliveredQuantity,
      color: Colors.blue,
      percentage: deliveredPercentage,
    );

    orderInfoList.add(delivered);

    /// Processing
    final processingQuantity =
        allOrders.where((i) => i.status == 'processing').length;

    final processingPercentage =
        (processingQuantity / allOrders.length * 100).toInt();

    final processing = OrderInfoEntity(
      id: 2,
      title: 'Processing',
      quantity: processingQuantity,
      color: Colors.yellow,
      percentage: processingPercentage,
    );

    orderInfoList.add(processing);

    /// Cancelled
    final cancelledQuantity =
        allOrders.where((i) => i.status == 'cancelled').length;

    final cancelledPercentage =
        (cancelledQuantity / allOrders.length * 100).toInt();

    final cancelled = OrderInfoEntity(
      id: 1,
      title: 'Cancelled',
      quantity: cancelledQuantity,
      color: Colors.green,
      percentage: cancelledPercentage,
    );

    orderInfoList.add(cancelled);

    ///
    return orderInfoList;
  }
}
