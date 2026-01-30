import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/theme_provider.dart';

/// Settings screen with theme toggle and app info
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        children: [
          // Appearance Section
          _SectionHeader(title: 'Appearance'),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Use dark theme'),
                secondary: Icon(
                  themeProvider.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                value: themeProvider.isDarkMode,
                onChanged: (_) => themeProvider.toggleTheme(),
              );
            },
          ),
          const Divider(),

          // About Section
          _SectionHeader(title: 'About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('About Unit Converter'),
            subtitle: const Text(
              'A comprehensive desktop unit converter application',
            ),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Unit Converter',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.calculate, size: 48),
                children: [
                  const Text(
                    'A modern desktop application for converting units across '
                    'multiple categories including Length, Weight, Temperature, '
                    'Currency, Volume, Area, Speed, and Time.',
                  ),
                  const SizedBox(height: 16),
                  const Text('Built with Flutter & Dart'),
                  const SizedBox(height: 8),
                  const Text('Architecture:'),
                  const Text('• Provider for state management'),
                  const Text('• GoRouter for navigation'),
                  const Text('• Drift for local database'),
                  const Text('• Dio for networking'),
                  const Text('• get_it for dependency injection'),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Technologies'),
            subtitle: const Text('Flutter, Dart, Provider, GoRouter, Drift, Dio'),
          ),
          const Divider(),

          // Data Section
          _SectionHeader(title: 'Data'),
          ListTile(
            leading: const Icon(Icons.api),
            title: const Text('Currency Data Source'),
            subtitle: const Text('ExchangeRate-API'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              // Could open URL in browser
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Using ExchangeRate-API for currency rates'),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Local Database'),
            subtitle: const Text('Drift (SQLite)'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
