 import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/common/section_label.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/info_section/info_row.dart';
import 'package:flutter/material.dart';

Widget buildSellerDatailsInfoSection(SellerModel seller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SellerDetailsSectionLabel('Contact & Account'),
              const SizedBox(height: 12),
             
              SellerDetaisInfoRow(icon: Icons.person_outline_rounded,
                  label: 'Owner', value: seller.ownerName),
              SellerDetaisInfoRow(icon: Icons.alternate_email_rounded,
                  label: 'Username', value: seller.userName),
              SellerDetaisInfoRow(icon: Icons.mail_outline_rounded,
                  label: 'Email', value: seller.email),
              SellerDetaisInfoRow(icon: Icons.phone_outlined,
                  label: 'Phone', value: seller.phoneNumber),
            ],
          ),
        ),

    
        Container(
          width: 0.5,
          color: Colors.white.withValues(alpha: 0.08),
          margin: const EdgeInsets.symmetric(horizontal: 20),
        ),

    
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SellerDetailsSectionLabel('Business & Address'),
              const SizedBox(height: 12),
              SellerDetaisInfoRow(icon: Icons.cake_outlined,
                  label: 'Date of Birth', value: seller.dateOfBirth),
              SellerDetaisInfoRow(icon: Icons.location_on_outlined,
                  label: 'Street', value: seller.street),
              SellerDetaisInfoRow(icon: Icons.map_outlined,
                  label: 'State', value: seller.state),
              SellerDetaisInfoRow(icon: Icons.pin_outlined,
                  label: 'Zip Code', value: seller.zipCode),
              SellerDetaisInfoRow(icon: Icons.place_outlined,
                  label: 'Landmark', value: seller.landMark),
            ],
          ),
        ),
      ],
    );
  }