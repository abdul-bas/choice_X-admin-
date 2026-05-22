
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/filter_fill.dart';
import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key, 
    required this.filters,
    required this.selected,
    required this.onTap,
  });

  final List<String>       filters;
  final String             selected;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: filters
          .map(
            (f) => FilterPill(
              label:      f,
              isSelected: selected == f,
              onTap:      () => onTap(f),
            ),
          )
          .toList(),
    );
  }
}
