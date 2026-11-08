import 'package:fa4_reverse_engineering/constants.dart';
import 'package:fa4_reverse_engineering/models/user.dart';
import 'package:fa4_reverse_engineering/screens/settings_screen.dart';
import 'package:fa4_reverse_engineering/screens/supply_manager_screen.dart';
import 'package:fa4_reverse_engineering/widgets/firefly_logo.dart';
import 'package:flutter/material.dart';

const double logoWidth = 300;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
    required this.onToggleTheme,
  });

  final User user;
  final void Function() onToggleTheme;

  void _gotoSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const SettingsScreen()),
    );
  }

  void _gotoSupplies(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const SupplyManagerScreen()),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Logout confirmation',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onToggleTheme,
          icon: const Icon(Icons.brightness_medium),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _gotoSettings(context);
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              _confirmLogout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 50),

            Text(
              'Hello \n ${user.firstName} ${user.lastName} \n You are now one of the Fireflies',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            const SizedBox(height: 50),

            const FireflyLogo(width: logoWidth),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                _gotoSupplies(context);
              },
              child: const Text('Check for Supplies'),
            ),
          ],
        ),
      ),
    );
  }
}
