import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/subscription_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  String _businessName = '';  
  String identificationNumber = '';
  String _subscriptionTier = '';
  String _username = '';
  String _name = '';
  bool _isLoading = true;
  String _nameUser = '';

  @override
  void initState() {
    super.initState();
    _loadAllDetails();
  }

  Future<void> _loadAllDetails() async {
    await Future.wait([
      _loadAccountDetails(),
      _loadUserDetails(),
      _getProfileDetails(),
      _loadSubscriptionDetails(),
      getProfileDetailsAccount(),
    ]);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadAccountDetails() async {
    final accountDetails = await AccountService().getAccountDetails();
    if (accountDetails != null) {
      setState(() {
        _businessName = accountDetails.businessName;
        identificationNumber = accountDetails.businessId;
      });
    }
  }

  Future<void> _getProfileDetails() async {
    try {
      final profileDetails = await ProfileService().getProfileDetails();
      if (profileDetails != null) {
        setState(() {
          _name = '${profileDetails.firstName} ${profileDetails.lastName}';
        });
      } else {
        print('Profile details are null');
      }
      print('Name: $_name');
    } catch (e) {
      print('Error: $e');
    }
  }

   Future<void> getProfileDetailsAccount() async {
    try {
      final profileAccountDetails = await ProfileService().getProfileDetailsofAccount();
      if (profileAccountDetails != null && mounted) {
        setState(() {
          _nameUser = '${profileAccountDetails.firstName} ${profileAccountDetails.lastName}';
        });
        print('Name User: $_nameUser');
      }
    } catch (e) {
      print('Error fetching profile details: $e');
    }
  }

  Future<void> _loadSubscriptionDetails() async {
    final subscriptionDetails = await SubscriptionService().getSubscriptionDetails();
    if (subscriptionDetails != null) {
      setState(() {
        _subscriptionTier = subscriptionDetails.tier;
      });
    }
  }

  Future<void> _loadUserDetails() async {
    final prefs = SharedPreferencesAsync();
    var username = await prefs.getString('username');
    setState(() {
      _username = username ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).accountDetails),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.accountDetails),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInformation(username: _username, name: _name, subscriptionTier: _subscriptionTier),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 32),
                  AccountInformation(
                    businessName: _businessName,
                    subscriptionTier: _subscriptionTier,
                    identificationNumber: identificationNumber, bankAccountOwner: _nameUser,
                  ),
                ],
              ),
            ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final String username;
  final String name;
  final String subscriptionTier;

  const UserInformation({
    super.key,
    required this.username,
    required this.name,
    required this.subscriptionTier,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).userInformation,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).userInformationDetails,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 24),
        _buildInfoRow(S.of(context).username, username),
        _buildInfoRow(S.of(context).name, name),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                // Lógica para cambiar la contraseña
                 Navigator.of(context).pushNamed(AppRoutes.setNewPassword);
              },
              child: Text(S.of(context).changePassword),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildInfoRow(String title, String value) {
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
class AccountInformation extends StatelessWidget {
  final String businessName;
  final String subscriptionTier;
  final String identificationNumber;
  final String bankAccountOwner;

  const AccountInformation({
    super.key,
    required this.businessName,
    required this.subscriptionTier,
    required this.identificationNumber,
    required this.bankAccountOwner,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: _getAccountId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null || snapshot.data == -1) {
          return Container(); // Retorna un contenedor vacío si no hay accountId
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).accountInformation,
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.chevron_right_outlined),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).accountInformationDetails,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 24),
            _buildInfoRow(S.of(context).businessName, businessName),
            _buildInfoRow(S.of(context).subscriptionTier, subscriptionTier),
            _buildInfoRow(S.of(context).identificationNumber, identificationNumber),
            _buildInfoRow(S.of(context).bankAccountOwner, bankAccountOwner),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.subscriptionDetails);
                  },
                  child: Text(S.of(context).manageSubscription),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<int?> _getAccountId() async {
    final prefs = SharedPreferencesAsync();
    final accountId = await prefs.getInt('accountId');
    return accountId;
  }

  static Widget _buildInfoRow(String title, String value) {
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