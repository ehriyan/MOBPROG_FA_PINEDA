import 'package:fa4_reverse_engineering/models/user.dart';
import 'package:fa4_reverse_engineering/screens/home_screen.dart';
import 'package:fa4_reverse_engineering/screens/sign_up_screen.dart';
import 'package:fa4_reverse_engineering/constants.dart';
import 'package:fa4_reverse_engineering/widgets/custom_text_field.dart';
import 'package:fa4_reverse_engineering/widgets/firefly_logo.dart';
import 'package:flutter/material.dart';

const double logoWidth = 400;

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.onToggleTheme,
  });

  final void Function() onToggleTheme;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  final List<User> _registeredUsers = [];

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _addUser(User user) {
    setState(() {
      _registeredUsers.add(user);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Firefly ${user.username} added successfully'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _login() {
    setState(() {
      _usernameError = _usernameController.text.isEmpty
          ? 'Kindly enter your username'
          : null;
      _passwordError = _passwordController.text.isEmpty
          ? 'Kindly enter your password'
          : null;
    });

    if (_usernameError != null || _passwordError != null) {
      return;
    }

    final user = _registeredUsers
        .where(
          (u) =>
              u.username == _usernameController.text &&
              u.password == _passwordController.text,
        )
        .firstOrNull;

    if (user == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Login failed.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(
          user: user,
          onToggleTheme: widget.onToggleTheme,
        ),
      ),
    );

    _usernameController.clear();
    _passwordController.clear();
  }

  void _gotoSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SignUpScreen(
          onToggleTheme: widget.onToggleTheme,
          onSignUp: _addUser,
        ),
      ),
    );
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
            const SizedBox(height: 90),

            const FireflyLogo(width: logoWidth),

            const SizedBox(height: 24),

            TextField(
              controller: _usernameController,
              style: Theme.of(context).textTheme.titleSmall,
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(
                  'Login',
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _gotoSignUp,
                child: const Text(
                  'Does not have an account yet? Sign Up now!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
