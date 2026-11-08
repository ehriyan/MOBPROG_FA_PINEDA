import 'package:fa4_reverse_engineering/models/supply.dart';
import 'package:fa4_reverse_engineering/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

const double chartHeight = 180;
const double chartMargin = 12;

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.supplies,
  });

  final List<Supply> supplies;

  List<SupplyBucket> get buckets {
    final categories = supplies.map((supply) => supply.category).toSet();

    final supplyBuckets = [
      for (final category in categories)
        SupplyBucket.forCategory(supplies, category),
    ];

    supplyBuckets.sort(
      (a, b) => a.totalQuantity.compareTo(b.totalQuantity),
    );

    return supplyBuckets;
  }

  int get maxTotalQuantity {
    int maxTotal = 0;

    for (final bucket in buckets) {
      if (bucket.totalQuantity > maxTotal) {
        maxTotal = bucket.totalQuantity;
      }
    }

    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      margin: const EdgeInsets.all(chartMargin),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      width: double.infinity,
      height: chartHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.3),
            primaryColor.withValues(alpha: 0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: [
          for (final bucket in buckets)
            ChartBar(
              fill: bucket.totalQuantity == 0
                  ? 0
                  : bucket.totalQuantity / maxTotalQuantity,
              color: bucket.category.color,
            ),
        ],
      ),
    );
  }
}