import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddFacilitySheet extends StatefulWidget {
  const AddFacilitySheet({super.key});

  @override
  _AddFacilitySheetState createState() => _AddFacilitySheetState();
}

class _AddFacilitySheetState extends State<AddFacilitySheet> {
  String facilityType = 'Restaurant';
  final TextEditingController _facilityNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Sheet Indicator
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Ruta de navegación
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).facilities,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Icon(Icons.chevron_right_outlined),
                  Text(
                    S.of(context).newFacility,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).newFacility,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SegmentedButton<String>(
                segments: <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Restaurant',
                    label: Text(S.of(context).restaurant),
                  ),
                  ButtonSegment<String>(
                    value: 'Warehouse',
                    label: Text(S.of(context).warehouse),
                  ),
                ],
                selected: <String>{facilityType},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    facilityType = newSelection.first;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: _facilityNameController,
            decoration: InputDecoration(
              labelText: S.of(context).facilityName,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).requiredField;
              }
              return null;
            },
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: S.of(context).city,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).requiredField;
              }
              return null;
            },
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: _regionController,
            decoration: InputDecoration(
              labelText: S.of(context).region,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).requiredField;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).cancel),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () {
                  // Acción para guardar la instalación
                },
                child: Text(S.of(context).save),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showAddFacilitySheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.8,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: const AddFacilitySheet(),
        );
      },
    ),
  );
}