import 'dart:convert';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/mobile_view/mobile_info_row.dart';
import 'package:flutter/material.dart';

class OrderMobileCard extends StatelessWidget {
  const OrderMobileCard({super.key, 
    required this.order,
    required this.user,
    required this.seller,
  });

  final OrderModel order;
  final UserModel user;
  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.sellerWhite10, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.brandSubtle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order ID',
                        style: TextStyle(
                            fontSize: 10, color: AppColors.sellerWhite60),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.orderId,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '₹${order.amount}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

        
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MobileInfoRow(label: 'Customer', value: user.name),
                const SizedBox(height: 8),
                MobileInfoRow(label: 'Seller', value: seller.userName),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: MobileInfoRow(
                          label: 'Status', value: order.itemStatus),
                    ),
                    Expanded(
                      child: MobileInfoRow(
                          label: 'Payment', value: order.paymentStatus),
                    ),
                  ],
                ),
                const Divider(color: AppColors.sellerWhite10, height: 24),

                
                const Text(
                  'Product Details',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: MemoryImage(base64Decode(order.images)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.productName,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${order.brand} • ${order.model}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.sellerWhite54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Qty: ${order.quantity} × ₹${order.amount}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.sellerWhite60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: AppColors.sellerWhite10, height: 24),

                const Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const MobileInfoRow(
                    label: 'Order Date', value: '11/12/2020'),
                const SizedBox(height: 8),
                MobileInfoRow(
                    label: 'Payment Method',
                    value: order.paymentMethod),
                const SizedBox(height: 8),
                MobileInfoRow(
                  label: 'Shipping Address',
                  value: order.paymentAddress,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
