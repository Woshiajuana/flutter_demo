import 'package:flutter/material.dart';
import 'package:playground/state/index.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:provider/provider.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  Widget _buildCell({
    required String label,
    required bool check,
    VoidCallback? onTap,
    String? description,
  }) {
    return StxCell(
      onTap: onTap,
      label: label,
      description: description,
      trailing: check ? const Icon(Icons.check) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    var languageState = context.watch<LanguageState>();

    var children = LanguageState.languageCodeLabelMap.entries.map((e) {
      return _buildCell(
        onTap: () {
          languageState.changeLanguage(e.key);
        },
        label: e.value,
        check: languageState.languageCode == e.key,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.languageSettingsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StxCellGroup(
              children: [
                _buildCell(
                  onTap: () {
                    languageState.changeLanguage(null);
                  },
                  label: context.l10n.languageSettingsAutomatic,
                  check: languageState.isFollowSystem,
                ),
              ],
            ),
            StxCellGroup(
              title: context.l10n.languageSettingsAutomaticDescription,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
