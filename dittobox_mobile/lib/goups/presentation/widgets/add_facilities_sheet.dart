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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Facilities',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.chevron_right_outlined),
                  Text(
                    'New facility',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New facility',
                    style: TextStyle(
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
                segments: const <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Restaurant',
                    label: Text('Restaurant'),
                  ),
                  ButtonSegment<String>(
                    value: 'Warehouse',
                    label: Text('Warehouse'),
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
          TextField(
            controller: _facilityNameController,
            decoration: const InputDecoration(
              labelText: 'Facility name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 26),
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 26),
          TextField(
            controller: _regionController,
            decoration: const InputDecoration(
              labelText: 'Region',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () {
                 
                },
                child: const Text('Save'),
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