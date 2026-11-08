import 'package:fa4_reverse_engineering/constants.dart';
import 'package:fa4_reverse_engineering/data/app_data.dart';
import 'package:fa4_reverse_engineering/models/parameter.dart';
import 'package:fa4_reverse_engineering/models/supply.dart';
import 'package:flutter/material.dart';

const double topPadding = 70;
const double formSpacing = 30;
const double colorBoxSize = 24;

class NewSupplyScreen extends StatefulWidget {
  const NewSupplyScreen({
    super.key,
    required this.onAddSupply,
  });

  final void Function(Supply supply) onAddSupply;

  @override
  State<NewSupplyScreen> createState() => _NewSupplyScreenState();
}

class _NewSupplyScreenState extends State<NewSupplyScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController(text: '1.00');

  String? _nameError;

  int _quantity = 1;
  Parameter _selectedCategory = parameters.first;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _saveSupply() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty 
          ? 'Input an item name' 
          : null;        
    });

    if (_nameError != null) {
      return;
    }
    
    final newSupply = Supply(
      name: _nameController.text,
      quantity: _quantity,
      unitPrice: double.tryParse(_priceController.text) ?? 0,
      category: _selectedCategory,
    );

    widget.onAddSupply(newSupply);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a new supply',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          horizontalPadding,
          topPadding,
          horizontalPadding,
          formSpacing,
        ),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                label: Text('Item Name'),
                errorText: _nameError,
              ),
            ),

            const SizedBox(height: formSpacing),

            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Item Quantity',
                contentPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _decreaseQuantity,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '$_quantity',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    onPressed: _increaseQuantity,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),

            const SizedBox(height: formSpacing),

            TextField(
              controller: _priceController,
              style: Theme.of(context).textTheme.titleSmall,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Unit Price',
                prefixText: '\$ ',
              ),
            ),

            const SizedBox(height: formSpacing),

            DropdownButtonFormField<Parameter>(
              value: _selectedCategory,
              isExpanded: true,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: const InputDecoration(
                labelText: 'Supply Category',
              ),
              items: parameters
                  .map(
                    (parameter) => DropdownMenuItem(
                      value: parameter,
                      child: Row(
                        children: [
                          Container(
                            width: colorBoxSize,
                            height: colorBoxSize,
                            color: parameter.color,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            parameter.name.toUpperCase(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: formSpacing),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSupply,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
