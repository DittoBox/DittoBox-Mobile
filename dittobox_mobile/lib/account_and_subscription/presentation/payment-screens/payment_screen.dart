import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _initCustomerSheet,
          child: Text('Pay'),
        ),
      ),
    );
  }

  Future<void> _initCustomerSheet() async {
    try {
      // 1. Retrieve customer data from backend
      final data = await _createTestCustomerSheet();

      // Create billing details
      final billingDetails = BillingDetails(
        name: 'Flutter Stripe',
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459 Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );

      // 2. Initialize the customer sheet
      await Stripe.instance.initCustomerSheet(
        customerSheetInitParams: CustomerSheetInitParams(
          setupIntentClientSecret: data['setupIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: data['customer'],
          customerEphemeralKeySecret: data['ephemeralKeySecret'],
          style: ThemeMode.system,
          defaultBillingDetails: billingDetails,
        ),
      );

      // 3. Present the customer sheet
      await Stripe.instance.presentCustomerSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment successfully modified')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

    Future<Map<String, dynamic>> _createTestCustomerSheet() async {
      try {
        // Aquí deberías llamar a tu backend para crear un Customer, Ephemeral Key y PaymentIntent
        final response = await http.post(
          Uri.parse('http://192.168.18.89:3000/create-customer-sheet'), // Reemplaza con la IP de tu máquina
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'amount': 1000, 'currency': 'usd'}),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['setupIntent'] != null && data['customer'] != null && data['ephemeralKeySecret'] != null) {
            return data;
          } else {
            throw Exception('Datos incompletos recibidos del servidor');
          }
        } else {
          throw Exception('Error en la solicitud al servidor: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Error al crear el Customer Sheet: $e');
      }
    }
}