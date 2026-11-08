import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.errorText,
  });

  final TextEditingController controller;
  final String? errorText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.titleSmall,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        label: const Text('Password'),
        errorText: widget.errorText, 
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
