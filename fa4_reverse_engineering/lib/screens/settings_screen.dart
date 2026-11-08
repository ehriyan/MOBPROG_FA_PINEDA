import 'package:fa4_reverse_engineering/models/parameter.dart';
import 'package:fa4_reverse_engineering/data/app_data.dart';
import 'package:fa4_reverse_engineering/screens/new_parameter_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _searchText = '';

  void _addParameter(Parameter parameter) {
    setState(() {
      parameters.add(parameter);
    });
  }

  void _gotoNewParameter() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NewParameterScreen(onAddParameter: _addParameter),
      ),
    );
  }

  List<Parameter> get _filteredParameters {
    final search = _searchText.toLowerCase();

    return parameters.where((parameter) {
      return parameter.name.toLowerCase().contains(search) ||
          parameter.parameterClass.toLowerCase().contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredParameters = _filteredParameters;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parameter Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: _gotoNewParameter,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                label: Text('Search by Class'),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: filteredParameters.isEmpty
                ? Center(
                    child: Text(
                      'No parameters saved',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    itemCount: filteredParameters.length,
                    itemBuilder: (ctx, index) {
                      final parameter = filteredParameters[index];

                      return ListTile(
                        dense: true,
                        leading: Container(
                          width: 24,
                          height: 24,
                          color: parameter.color,
                        ),
                        title: Text(
                          parameter.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: Text(
                          parameter.parameterClass.toUpperCase(),
                          style: TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
