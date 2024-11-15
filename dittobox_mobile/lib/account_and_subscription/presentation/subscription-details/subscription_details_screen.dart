import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/subscription_service.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/profile_services.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa intl para formatear la fecha

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  _SubscriptionDetailsScreenState createState() => _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  String _currentTier = '';
  String _status = '';
  String _nextPaymentDay = '';
  String _identificationNumber = '';
  String _bankAccountOwner = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllDetails();
  }

  Future<void> _loadAllDetails() async {
    await Future.wait([
      _loadSubscriptionDetails(),
      _loadProfileDetails(),
      _loadAccountDetails(),
    ]);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadSubscriptionDetails() async {
    final subscriptionDetails = await SubscriptionService().getSubscriptionDetails();
    if (subscriptionDetails != null) {
      setState(() {
        _currentTier = subscriptionDetails.tier;
        _status = subscriptionDetails.subscriptionStatusId == 1 ? 'Active' : 'Expired';
        _nextPaymentDay = DateFormat('yyyy-MM-dd').format(subscriptionDetails.lastPaidPeriod); // Formatea la fecha
      });
    }
  }

  Future<void> _loadProfileDetails() async {
    final profileDetails = await ProfileService().getProfileDetails();
    if (profileDetails != null) {
      setState(() {
        _bankAccountOwner = '${profileDetails.firstName} ${profileDetails.lastName}';
      });
    }
  }

  Future<void> _loadAccountDetails() async {
    final accountDetails = await AccountService().getAccountDetails();
    if (accountDetails != null) {
      setState(() {
        _identificationNumber = accountDetails.businessId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).subscriptionDetails),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.subscriptionDetails),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Spinner de carga
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubscriptionDetails(
                    currentTier: _currentTier,
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 32),
                  PaymentInformation(
                    status: _status,
                    nextPaymentDay: _nextPaymentDay,
                    identificationNumber: _identificationNumber,
                    bankAccountOwner: _bankAccountOwner,
                  ),
                ],
              ),
            ),
    );
  }
}

class SubscriptionDetails extends StatelessWidget {
  final String currentTier;

  const SubscriptionDetails({
    super.key,
    required this.currentTier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).subscription,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 16),
        Text(
          S.of(context).subscriptionDetails,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 24),
        _buildInfoRow('Current tier', currentTier),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.subscriptionPlans);
            },
            child: Text(S.of(context).upgradePlan),
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

class PaymentInformation extends StatelessWidget {
  final String status;
  final String nextPaymentDay;
  final String identificationNumber;
  final String bankAccountOwner;

  const PaymentInformation({
    super.key,
    required this.status,
    required this.nextPaymentDay,
    required this.identificationNumber,
    required this.bankAccountOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentInformation,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 24),
        _buildInfoRow(S.of(context).status, status),
        _buildInfoRow(S.of(context).nextPaymentDay, nextPaymentDay),
        _buildInfoRow(S.of(context).identificationNumber, identificationNumber),
        _buildInfoRow(S.of(context).bankAccountOwner, bankAccountOwner),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                // Lógica para actualizar la información de pago
              },
              child: Text(S.of(context).updatePaymentInformation),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                // Lógica para cancelar la suscripción
              },
              child: Text(S.of(context).cancelSubscription),
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