import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/reassign_worker_sheet.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/profile_services.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/models/profile_model.dart';
import 'package:flutter/material.dart';

class WorkerDetailScreen extends StatefulWidget {
  final Profile worker;

  const WorkerDetailScreen({super.key, required this.worker});

  @override
  _WorkerDetailScreenState createState() => _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
  bool _showRoleManagement = false;
  final List<bool> _switchStates = List.filled(3, false); // Inicializar con 3 elementos
  String? _location;
  final ProfileService _profileService = ProfileService(); // Crea una instancia de ProfileService

  @override
  void initState() {
    super.initState();
    _initializeSwitchStates();
    _fetchGroupLocation();
  }

  void _initializeSwitchStates() {
    setState(() {
      _switchStates[0] = widget.worker.privileges.contains('WorkerManagement');
      _switchStates[1] = widget.worker.privileges.contains('GroupManagement');
      _switchStates[2] = widget.worker.privileges.contains('AccountManagement');
    });
  }

  Future<void> _fetchGroupLocation() async {
    final location = await AccountService().getGroupLocation(widget.worker.groupId);
    if (location != null) {
      setState(() {
        final addressParts = location['address'].split(' ');
        _location = addressParts.length > 1 ? '${addressParts[0]} ${addressParts[1]}' : location['address'];
      });
    }
  }

  Future<void> _updatePrivileges(int index, bool value) async {
    final confirm = await _showConfirmationDialog(value);
    if (!confirm) return;

    try {
      if (value) {
        await _profileService.grantPrivileges(widget.worker.id, index);
      } else {
        await _profileService.revokePrivileges(widget.worker.id, index);
      }
      // Actualiza el estado del interruptor
      setState(() {
        _switchStates[index] = value;
      });
      // Vuelve a cargar los datos del perfil
      await _reloadProfile();
      print('Privileges updated');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: use_build_context_synchronously
        SnackBar(content: Text(S.of(context).privilegesUpdatedSuccessfully)),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: use_build_context_synchronously
        SnackBar(content: Text(S.of(context).failedToUpdatePrivileges)),
      );
      print('Failed to update privileges: $e');
    }
  }

  Future<void> _reloadProfile() async {
    final updatedProfile = await _profileService.getProfileDetailsById(widget.worker.id);
    if (updatedProfile != null) {
      setState(() {
        widget.worker.privileges = updatedProfile.privileges;
        _initializeSwitchStates();
      });
    }
  }

  Future<bool> _showConfirmationDialog(bool value) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(value ? 'Grant Privilege' : 'Revoke Privilege'),
          content: Text(value
              ? S.of(context).areYouSureYouWantToGrantThisPrivilege
              : S.of(context).areYouSureYouWantToRevokeThisPrivilege),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(S.of(context).cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.worker.firstName} ${widget.worker.lastName}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.chevron_right_outlined),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.worker.firstName} ${widget.worker.lastName}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).workerDetails,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            _buildWorkerInfoRow(S.of(context).category, _isManager() ? 'Manager' : 'Worker'),
            _buildWorkerInfoRow(S.of(context).location, _location ?? 'Loading...'),
            const SizedBox(height: 16),
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
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ReassignWorkerSheet(
                          facilities: const ['Restaurante A', 'Almacén B'], // facilities example list
                          currentFacility: _location ?? 'Loading...',
                          onSave: (newFacility) {
                            Navigator.pop(context); 

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).workerReassigned),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    S.of(context).reassign),
                ),
              ],
            ),
            if (_showRoleManagement) ...[
              const SizedBox(height: 24),
              Text(S.of(context).roleManagement, style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SwitchListTile(
                      title: Text(_getPrivilegeName(index)),
                      value: _switchStates[index],
                      onChanged: (bool value) {
                        _updatePrivileges(index, value);
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

  bool _isManager() {
    return widget.worker.privileges.contains('WorkerManagement') ||
           widget.worker.privileges.contains('GroupManagement') ||
           widget.worker.privileges.contains('AccountManagement');
  }

  String _getPrivilegeName(int index) {
    switch (index) {
      case 0:
        return 'WorkerManagement';
      case 1:
        return 'GroupManagement';
      case 2:
        return 'AccountManagement';
      default:
        return '';
    }
  }

  Widget _buildWorkerInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}