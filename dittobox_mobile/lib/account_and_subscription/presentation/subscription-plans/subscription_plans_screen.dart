import 'package:dittobox_mobile/account_and_subscription/presentation/widgets/payment_bottom_sheet.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).subscriptionPlans),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            S.of(context).monthlyPlans,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildPlanCard(
            context,
            S.of(context).advancePlan,
            '\$6.99 / ${S.of(context).month}',
            [
              '${S.of(context).upTo} 5 ${S.of(context).restaurants}',
              S.of(context).allFromStarterPlan,
              S.of(context).priorityTechnicalSupport,
              S.of(context).automaticTemplates,
              S.of(context).simultaneousMonitoring,
            ],
          ),
          _buildPlanCard(
            context,
            S.of(context).premiumPlan,
            '\$9.99 / ${S.of(context).month}',
            [
              '${S.of(context).upTo} 10 ${S.of(context).restaurants}',
              S.of(context).allFromAdvancePlan,
              S.of(context).supportForLargerChains,
              S.of(context).fasterTechnicalSupport,
              S.of(context).advancedAutomaticTemplates,
            ],
          ),
          const SizedBox(height: 32),
          Text(
            S.of(context).yearlyPlans,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildPlanCard(
            context,
            S.of(context).advancePlan,
            '\$76.99 / ${S.of(context).yearly}',
            [
              '${S.of(context).upTo} 5 ${S.of(context).restaurants}',
              S.of(context).allFromStarterPlan,
              S.of(context).priorityTechnicalSupport,
              S.of(context).automaticTemplates,
              S.of(context).simultaneousMonitoring,
            ],
          ),
          _buildPlanCard(
            context,
            S.of(context).premiumPlan,
            '\$107.99 / ${S.of(context).yearly}',
            [
              '${S.of(context).upTo} 10 ${S.of(context).restaurants}',
              S.of(context).allFromAdvancePlan,
              S.of(context).supportForLargerChains,
              S.of(context).fasterTechnicalSupport,
              S.of(context).advancedAutomaticTemplates,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, String title, String price, List<String> descriptions) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(price),
            const SizedBox(height: 8),
            for (var description in descriptions) ...[
              Text(description),
              const SizedBox(height: 4),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    _showPaymentBottomSheet(context, title, price);
                  },
                  child: Text(S.of(context).subscribe),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentBottomSheet(BuildContext context, String title, String price) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return PaymentBottomSheet(
          planTitle: title,
          planPrice: price,
        );
      },
    );
  }
}