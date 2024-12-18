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
  final List<bool> _checkboxStates = List.filled(3, false); // Inicializar con 3 elementos
  String? _location;
  final ProfileService _profileService = ProfileService(); // Crea una instancia de ProfileService

  @override
  void initState() {
    super.initState();
    _initializeCheckboxStates();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchGroupLocation();
  }

  void _initializeCheckboxStates() {
    setState(() {
      _checkboxStates[0] = widget.worker.privileges.contains('WorkerManagement');
      _checkboxStates[1] = widget.worker.privileges.contains('GroupManagement');
      _checkboxStates[2] = widget.worker.privileges.contains('AccountManagement');
    });
  }

  Future<void> _fetchGroupLocation() async {
    final location = widget.worker.groupId != null 
        ? await AccountService().getGroupLocation(widget.worker.groupId!)
        : null;
    setState(() {
      if (location != null) {
        final addressParts = location['address'].split(' ');
        _location = addressParts.length > 1 ? '${addressParts[0]} ${addressParts[1]}' : location['address'];
      } else {
        _location = S.of(context).noLocation;
      }
    });
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
      // Vuelve a cargar los datos del perfil
      final updatedProfile = await _profileService.getProfileDetailsById(widget.worker.id);
      if (updatedProfile != null) {
        setState(() {
          widget.worker.privileges = updatedProfile.privileges;
          _initializeCheckboxStates();
        });
      }
      print('Privileges updated');
      // Regresa a la lista de trabajadores
      Navigator.pop(context, true);
    } catch (e) {
      print('Failed to update privileges: $e');
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
            Navigator.pop(context, true);
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
            _buildWorkerInfoRow(S.of(context).category, _isOwner(widget.worker) ? S.of(context).owner : (_isManager() ? S.of(context).manager : S.of(context).worker)),
            _buildWorkerInfoRow(S.of(context).location, _location ?? S.of(context).noLocation),
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
                    return CheckboxListTile(
                      title: Text(_getPrivilegeName(index)),
                      value: _checkboxStates[index],
                      onChanged: (bool? value) {
                        if (value != null) {
                          _updatePrivilege(index, value);
                        }
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

  void _updatePrivilege(int index, bool value) {
    setState(() {
      _checkboxStates[index] = value;
    });
    _updatePrivileges(index, value);
  }

  bool _isManager() {
    return widget.worker.privileges.contains('WorkerManagement') ||
           widget.worker.privileges.contains('GroupManagement') ||
           widget.worker.privileges.contains('AccountManagement');
  }

  bool _isOwner(Profile profile) {
    return profile.privileges.contains('WorkerManagement') &&
           profile.privileges.contains('GroupManagement') &&
           profile.privileges.contains('AccountManagement');
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