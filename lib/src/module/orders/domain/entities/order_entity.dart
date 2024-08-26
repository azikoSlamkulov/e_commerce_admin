import 'package:equatable/equatable.dart';

import 'bag_entity.dart';

class OrderEntity extends Equatable {
  final String? id;
  final String? userID;
  final String? userName;
  final int? orderNumber;
  final String? trackingNumber;
  final String? status;
  final List<BagEntity>? items;
  final String? shippingAddress;
  final String? paymentMethod;
  final String? deliveryMethod;
  final String? discount;
  final int? totalAmount;
  final String? createdDate;

  const OrderEntity({
    this.id,
    this.userID,
    this.userName,
    this.orderNumber,
    this.trackingNumber,
    this.status,
    this.items,
    this.shippingAddress,
    this.paymentMethod,
    this.deliveryMethod,
    this.discount,
    this.totalAmount,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        userID,
        userName,
        orderNumber,
        trackingNumber,
        status,
        items,
        shippingAddress,
        paymentMethod,
        deliveryMethod,
        discount,
        totalAmount,
        createdDate,
      ];
}
