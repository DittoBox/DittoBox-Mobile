import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  _SubscriptionDetailsScreenState createState() => _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).subscriptionDetails),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.subscriptionDetails),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionDetails(),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32),
            PaymentInformation(),
          ],
        ),
      ),
    );
  }
}

class SubscriptionDetails extends StatelessWidget {
  const SubscriptionDetails({super.key});

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
         Text(S.of(context).subscriptionDetails,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 24),
        _buildInfoRow('Current tier', 'Advance'),
        _buildInfoRow('Facilities', 'Used 5 out of 5'),
        _buildInfoRow('Containers', 'Used 4 out of 25'),
        _buildInfoRow('Users', 'Used 7 out of 20'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                // Lógica para actualizar el plan
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
  const PaymentInformation({super.key});

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
        _buildInfoRow('Status', 'Active'),
        _buildInfoRow('Next Payment Day', '2023-12-01'),
        _buildInfoRow('Identification Number', '123456789'),
        _buildInfoRow('Bank Account Owner', 'John Doe'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                // Lógica para actualizar la información de pago
              },
              child: const Text('Update'),
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