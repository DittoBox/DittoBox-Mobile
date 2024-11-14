import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

class ContainerSelectionModal extends StatelessWidget {
  final List<model.Container> containers;
  final Function(model.Container) onContainerSelected;

  const ContainerSelectionModal({super.key, required this.containers, required this.onContainerSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).selectContainers),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: containers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(containers[index].name),
              onTap: () {
                onContainerSelected(containers[index]);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).cancel),
        ),
      ],
    );
  }
}