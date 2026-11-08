import 'package:fa4_reverse_engineering/models/user.dart';
import 'package:fa4_reverse_engineering/constants.dart';
import 'package:fa4_reverse_engineering/widgets/custom_text_field.dart';
import 'package:fa4_reverse_engineering/widgets/firefly_logo.dart';
import 'package:flutter/material.dart';

const double logoWidth = 270;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.onToggleTheme,
    required this.onSignUp,
  });

  final void Function() onToggleTheme;
  final void Function(User user) onSignUp;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  String? _usernameError;
  String? _passwordError;
  String? _firstNameError;
  String? _lastNameError;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _signUp() {
    setState(() {
      _usernameError = _usernameController.text.isEmpty
          ? 'Kindly enter your username'
          : null;
      _passwordError = _passwordController.text.isEmpty
          ? 'Kindly enter your password'
          : null;
      _firstNameError = _firstNameController.text.isEmpty
          ? 'Kindly enter your first name'
          : null;
      _lastNameError = _lastNameController.text.isEmpty
          ? 'Kindly enter your last name'
          : null;
    });

    if (_usernameError != null ||
        _passwordError != null ||
        _firstNameError != null ||
        _lastNameError != null) {
      return;
    }

    final newUser = User(
      username: _usernameController.text,
      password: _passwordController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
    );

    Navigator.pop(context);
    widget.onSignUp(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.brightness_medium),
          onPressed: widget.onToggleTheme,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),

            const FireflyLogo(width: logoWidth),

            const SizedBox(height: 12),

            Text(
              'Become a Firefly',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _usernameController,
              style: Theme.of(context).textTheme.titleSmall,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('Username'),
                errorText: _usernameError,
              ),
            ),

            const SizedBox(height: 10),

            CustomTextField(
              controller: _passwordController,
              errorText: _passwordError,
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _firstNameController,
              style: Theme.of(context).textTheme.titleSmall,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('First Name'),
                errorText: _firstNameError,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _lastNameController,
              style: Theme.of(context).textTheme.titleSmall,
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('Last Name'),
                errorText: _lastNameError,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUp,
                child: const Text(
                  'Signup',
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
