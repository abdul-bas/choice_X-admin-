
  import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/common/section_label.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/meta_section/meta_chip.dart';
import 'package:flutter/material.dart';

Widget buildMetaSection(dynamic seller) {
    final String createdAt = seller.createdAt?.toDate().toString() ?? '—';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SellerDetailsSectionLabel('Metadata'),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SellerDetailsMetaChip(
                label: 'UID',
                value: seller.uid ?? '—',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SellerDetailsMetaChip(
                label: 'Registered',
                value: createdAt,
              ),
            ),
          ],
        ),
      ],
    );
  }