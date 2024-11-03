import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).accountDetails),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.accountDetails),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInformation(),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32),
            AccountInformation(),
          ],
        ),
      ),
    );
  }

}

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

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
        _buildInfoRow(S.of(context).username, 'A warm place'),
        _buildInfoRow(S.of(context).name, 'Advance'),
        _buildInfoRow(S.of(context).identificationNumber, '20124578963'),
        _buildInfoRow(S.of(context).bankAccountOwner, 'Sofía Pérez'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // Lógica para editar datos
              },
              child: Text(S.of(context).editData),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                // Lógica para cambiar contraseña
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
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
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
        _buildInfoRow(S.of(context).businessName, 'A warm place'),
        _buildInfoRow(S.of(context).subscriptionTier, 'Advance'),
        _buildInfoRow(S.of(context).identificationNumber, '20124578963'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                // Lógica para gestionar la suscripción
              },
              child: Text(S.of(context).manageSubscription),
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