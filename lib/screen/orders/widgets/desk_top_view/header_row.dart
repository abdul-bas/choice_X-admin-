
import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:flutter/material.dart';

class OrderHeaderRow extends StatelessWidget {
  const OrderHeaderRow({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final fontSize = isTablet ? 10.0 : 12.0;
    final hPad = isTablet ? 10.0 : 15.0;

    final headers = [
      'Order ID',
      'Customer Name',
      'Seller Name',
      'Status',
      'Payment Status',
      'Total',
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 10),
      child: Row(
        children: headers
            .map(
              (h) => Expanded(
                flex: 2,
                child: TextInter(
                  text: h,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
