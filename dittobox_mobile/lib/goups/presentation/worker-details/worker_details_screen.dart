import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class WorkerDetailScreen extends StatefulWidget {
  final User worker;

  const WorkerDetailScreen({super.key, required this.worker});

  @override
  _WorkerDetailScreenState createState() => _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
  bool _showRoleManagement = false;
  List<bool> _switchStates = List.filled(5, false); // Inicializar con 5 elementos

  @override
  void initState() {
    super.initState();
    // Inicializar _switchStates con el número de switches necesarios
    _switchStates = List.filled(5, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.worker.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).workers,
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.chevron_right_outlined),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.worker.name,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).workerDetails,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            _buildWorkerInfoRow('Category', widget.worker.role),
            _buildWorkerInfoRow('Location', widget.worker.location),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    setState(() {
                      _showRoleManagement = !_showRoleManagement;
                    });
                  },
                  child: Text(S.of(context).roleManagement),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).reassign),
                ),
              ],
            ),
            if (_showRoleManagement) ...[
              SizedBox(height: 24),
              Text(
                'Role management',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SwitchListTile(
                      title: Text('Privilege assignment'),
                      value: _switchStates[index],
                      onChanged: (bool value) {
                        setState(() {
                          _switchStates[index] = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWorkerInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String role;
  final String location;

  User({required this.name, required this.role, required this.location});
}