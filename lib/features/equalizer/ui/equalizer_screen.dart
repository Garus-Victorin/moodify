import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodify/core/services/audio_service.dart';

class EqualizerScreen extends ConsumerWidget {
  const EqualizerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Égaliseur')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPresetsSection(context),
          const SizedBox(height: 24),
          _buildBandsSection(context),
          const SizedBox(height: 24),
          _buildEffectsSection(context),
        ],
      ),
    );
  }

  Widget _buildPresetsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Presets',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
             _buildPresetChip(context, 'Normal', true),
            _buildPresetChip(context, 'Rock', false),
            _buildPresetChip(context, 'Pop', false),
            _buildPresetChip(context, 'Jazz', false),
            _buildPresetChip(context, 'Classique', false),
            _buildPresetChip(context, 'Hip-Hop', false),
            _buildPresetChip(context, 'Dance', false),
          ],
        ),
      ],
    );
  }

  Widget _buildPresetChip(BuildContext context, String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {},
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : null,
      ),
    );
  }

  Widget _buildBandsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bandes de fréquence',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final frequencies = [
                60,
                170,
                310,
                600,
                1000,
                3000,
                6000,
                12000,
                14000,
                16000,
              ];
              return _buildBandSlider(frequencies[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBandSlider(int frequency) {
    return Column(
      children: [
        Text('${frequency}Hz'),
        const SizedBox(height: 8),
        SizedBox(
          width: 60,
          child: RotatedBox(
            quarterTurns: 1,
            child: Slider(value: 0.5, min: -1, max: 1, onChanged: (value) {}),
          ),
        ),
      ],
    );
  }

  Widget _buildEffectsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Effets audio',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildEffectSlider('Bass Boost', 0.0),
              _buildEffectSlider('Virtualizer', 0.0),
              _buildEffectSlider('Reverb', 0.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEffectSlider(String label, double value) {
    return ListTile(
      title: Text(label),
      subtitle: Slider(
        value: value,
        min: 0,
        max: 1,
        divisions: 10,
        label: '${(value * 100).toInt()}%',
        onChanged: (newValue) {},
      ),
    );
  }
}
