import 'package:fa4_reverse_engineering/data/app_data.dart';
import 'package:fa4_reverse_engineering/models/supply.dart';
import 'package:fa4_reverse_engineering/screens/new_supply_screen.dart';
import 'package:fa4_reverse_engineering/widgets/chart.dart';
import 'package:fa4_reverse_engineering/widgets/supply_item.dart';
import 'package:flutter/material.dart';

const Duration chartLoadingDuration = Duration(seconds: 2);

class SupplyManagerScreen extends StatefulWidget {
  const SupplyManagerScreen({super.key});

  @override
  State<SupplyManagerScreen> createState() => _SupplyManagerScreenState();
}

class _SupplyManagerScreenState extends State<SupplyManagerScreen> {
  bool _isChartLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(chartLoadingDuration, () {
      if (mounted) {
        setState(() {
          _isChartLoading = false;
        });
      }
    });
  }

  void _removeSupply(Supply supply) {
    setState(() {
      supplies.remove(supply);
    });
  }

  void _addSupply(Supply supply) {
    setState(() {
      supplies.add(supply);
    });
  }

  void _gotoNewSupply() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NewSupplyScreen(onAddSupply: _addSupply),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Supply Manager',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: _gotoNewSupply,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isChartLoading)
            const SizedBox(
              height: chartHeight + chartMargin * 2,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(chartMargin),
                child: SizedBox.expand(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          else
            Chart(supplies: supplies),

          Expanded(
            child: ListView.builder(
              itemCount: supplies.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(supplies[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.primary,
                ),
                onDismissed: (direction) {
                  _removeSupply(supplies[index]);
                },
                child: SupplyItem(supplies[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
