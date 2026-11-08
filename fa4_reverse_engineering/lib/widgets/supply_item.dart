import 'package:fa4_reverse_engineering/models/supply.dart';
import 'package:flutter/material.dart';

const double colorBoxSize = 24;

class SupplyItem extends StatelessWidget {
  const SupplyItem(this.supply, {super.key});

  final Supply supply;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              supply.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 4),

            Row(
              children: [
                Text(
                  '\$${supply.unitPriceText} X ${supply.quantity} = \$${supply.totalPriceText}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                const Spacer(),

                Container(
                  width: colorBoxSize,
                  height: colorBoxSize,
                  color: supply.category.color,
                ),

                const SizedBox(width: 4),

                Text(
                  supply.category.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
