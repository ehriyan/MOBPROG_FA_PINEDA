import 'package:fa4_reverse_engineering/models/parameter.dart';

String formatNumber(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  }
  return value.toString();
}

class Supply {
  const Supply({
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.category,
  });

  final String name;
  final int quantity;
  final double unitPrice;
  final Parameter category;

  String get unitPriceText {
    return formatNumber(unitPrice);
  }

  String get totalPriceText {
    return formatNumber(unitPrice * quantity);
  }
}

class SupplyBucket {
  SupplyBucket.forCategory(List<Supply> allSupplies, this.category)
      : supplies = allSupplies
            .where((supply) => supply.category == category)
            .toList();

  final Parameter category;
  final List<Supply> supplies;

  int get totalQuantity {
    int sum = 0;

    for (final supply in supplies) {
      sum += supply.quantity;
    }

    return sum;
  }
}