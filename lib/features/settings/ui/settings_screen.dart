import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/theme/app_theme.dart';
import 'package:moodify/core/providers/app_providers.dart';
import 'package:moodify/routes/app_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle(context, 'Thème'),
          Card(
            child: Column(
              children: [
                _buildListTile(
                  context,
                  'Clair',
                  Icons.light_mode_rounded,
                  () => _changeTheme(context, ref, ThemeMode.light),
                ),
                _buildListTile(
                  context,
                  'Sombre',
                  Icons.dark_mode_rounded,
                  () => _changeTheme(context, ref, ThemeMode.dark),
                ),
                _buildListTile(
                  context,
                  'AMOLED',
                  Icons.brightness_auto_rounded,
                  () => _changeTheme(context, ref, ThemeMode.system),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Lecture'),
          Card(
            child: Column(
              children: [
                _buildSwitchTile('Lecture automatique', true, (value) {}),
                _buildSwitchTile('Reprendre la lecture', true, (value) {}),
                _buildSwitchTile('Crossfade', false, (value) {}),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Bibliothèque'),
          Card(
            child: Column(
              children: [
                _buildListTile(
                  context,
                  'Scanner la bibliothèque',
                  Icons.refresh_rounded,
                  () {},
                ),
                _buildListTile(
                  context,
                  'Dossiers ignorés',
                  Icons.folder_off_rounded,
                  () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Audio'),
          Card(
            child: Column(
              children: [
                _buildListTile(
                  context,
                  'Égaliseur',
                  Icons.equalizer_rounded,
                  () => AppRouter.navigateToEqualizer(context),
                ),
                _buildListTile(
                  context,
                  'Bass Boost',
                  Icons.graphic_eq_rounded,
                  () {},
                ),
                _buildListTile(
                  context,
                  'Virtualizer',
                  Icons.surround_sound_rounded,
                  () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'À propos'),
          Card(
            child: Column(
              children: [
                _buildListTile(context, 'Version', Icons.info_rounded, () {}),
                _buildListTile(
                  context,
                  'Licences',
                  Icons.description_rounded,
                  () {},
                ),
                _buildListTile(context, 'Avis', Icons.star_rounded, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }

  void _changeTheme(BuildContext context, WidgetRef ref, ThemeMode mode) {
    // TODO: Implement theme changing logic
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Thème changé en ${mode.toString().split('.').last}')),
    );
  }

  Widget _buildSwitchTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      secondary: const Icon(Icons.settings_rounded),
    );
  }
}
