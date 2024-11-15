import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

class PaymentBottomSheet extends StatefulWidget {
  final String planTitle;
  final String planPrice;

  const PaymentBottomSheet({
    super.key,
    required this.planTitle,
    required this.planPrice,
  });

  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).paymentInformation,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.planTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.planPrice,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            CreditCardForm(
              formKey: _formKey,
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _cardHolderName,
              cvvCode: _cvvCode,
              onCreditCardModelChange: _onCreditCardModelChange,
              obscureCvv: true,
              obscureNumber: false,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              enableCvv: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cardNumberValidator: (value) {
                if (value == null || value.isEmpty || value.length < 16) {
                  return S.of(context).invalidCardNumber;
                }
                return null;
              },
              expiryDateValidator: (value) {
                if (value == null || value.isEmpty || !RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                  return S.of(context).invalidExpiryDate;
                }
                return null;
              },
              cvvValidator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return S.of(context).invalidCvv;
                }
                return null;
              },
              cardHolderValidator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).invalidCardHolderName;
                }
                return null;
              },
              onFormComplete: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).paymentSuccessful)),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).cancel),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).paymentSuccessful)),
                      );
                    }
                  },
                  child: Text(S.of(context).pay),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  void _onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      _cardNumber = creditCardModel.cardNumber;
      _expiryDate = creditCardModel.expiryDate;
      _cardHolderName = creditCardModel.cardHolderName;
      _cvvCode = creditCardModel.cvvCode;
    });
  }
}