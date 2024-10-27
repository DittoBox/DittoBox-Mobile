import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

// Container Selection Modal Widget
class ContainerSelectionModal extends StatefulWidget {
  final List<String> containers;

  const ContainerSelectionModal({super.key, required this.containers});

  @override
  _ContainerSelectionModalState createState() => _ContainerSelectionModalState();
}

class _ContainerSelectionModalState extends State<ContainerSelectionModal> {
  final Map<String, bool> _selectedContainers = {};

  @override
  void initState() {
    super.initState();
    for (var container in widget.containers) {
      _selectedContainers[container] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).selectContainers),
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                S.of(context).containerSelectionModal,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              ...widget.containers.map((container) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SwitchListTile(
                    title: Text(container),
                    value: _selectedContainers[container]!,
                    onChanged: (bool value) {
                      setState(() {
                        _selectedContainers[container] = value;
                      });
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FilledButton(
          child: Text(S.of(context).save),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    );
  }
}