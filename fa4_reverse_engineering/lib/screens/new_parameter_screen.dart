import 'package:fa4_reverse_engineering/models/parameter.dart';
import 'package:fa4_reverse_engineering/widgets/color_wheel.dart';
import 'package:flutter/material.dart';

const Color defaultParameterColor = Colors.black;

const double sidePadding = 12;
const double columnSpacing = 24;
const double classFieldMaxWidth = 293;
const double pickerColumnMaxWidth = 277;
const double wheelMaxSize = 230;
const double classFieldBottomPadding = 45;
const double hexBoxSize = 24;

class NewParameterScreen extends StatefulWidget {
  const NewParameterScreen({
    super.key,
    required this.onAddParameter,
  });

  final void Function(Parameter parameter) onAddParameter;

  @override
  State<NewParameterScreen> createState() => _NewParameterScreenState();
}

class _NewParameterScreenState extends State<NewParameterScreen> {
  final _nameController = TextEditingController();
  final _classController = TextEditingController();

  String? _nameError;
  String? _classError;

  Color _selectedColor = defaultParameterColor;

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    super.dispose();
  }

  void _reset() {
    _nameController.clear();
    _classController.clear();
  }

  void _addParameter() {
    setState(() {
      _nameError = _nameController.text.isEmpty
          ? 'Must be between 1 and 50 Characters'
          : null;
      _classError = _classController.text.isEmpty
          ? 'Must be between 1 and 50 Characters'
          : null;
    });

    if (_nameError != null || _classError != null) {
      return;
    }

    final newParameter = Parameter(
      name: _nameController.text,
      parameterClass: _classController.text,
      color: _selectedColor,
    );

    widget.onAddParameter(newParameter);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final hexCode = _selectedColor
        .toARGB32()
        .toRadixString(16)
        .toUpperCase()
        .padLeft(8, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a new parameter',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              maxLength: 50,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Parameter Name',
                errorText: _nameError,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: classFieldMaxWidth,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: classFieldBottomPadding,
                        ),
                        child: TextField(
                          controller: _classController,
                          maxLength: 50,
                          style: Theme.of(context).textTheme.titleSmall,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(), 
                            labelText: 'Parameter Class',
                            errorText: _classError, 
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: columnSpacing,
                ), 

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: wheelMaxSize,
                      child: Column(
                        children: [
                          ColorWheel(
                            size: wheelMaxSize,
                            onColorChanged: (color) {
                              setState(() {
                                _selectedColor = color;
                              });
                            },
                          ),
                          const SizedBox(height: 12), 
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, 
                            children: [
                              Container(
                                width: hexBoxSize,
                                height: hexBoxSize,
                                color: _selectedColor,
                              ),
                              const SizedBox(width: 8),
                              Text(hexCode),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Wrap(
                      spacing: 10,
                      children: [
                        TextButton(
                          onPressed: _reset,
                          child: const Text('Reset'),
                        ),
                        ElevatedButton(
                          onPressed: _addParameter,
                          child: const Text('Add Parameter'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
