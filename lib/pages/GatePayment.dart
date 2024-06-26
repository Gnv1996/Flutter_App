import 'package:flutter/material.dart';
import '../model/catalog.dart';
import '../widgets/theme.dart';

class PaymentGatewayPage extends StatefulWidget {
  final List<Item> items;
  final double totalPrice;

  PaymentGatewayPage({
    Key? key,
    required this.items,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _PaymentGatewayPageState createState() => _PaymentGatewayPageState();
}

class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
  PaymentMethod _selectedMethod = PaymentMethod.UPI; // Default to UPI

  @override
  Widget build(BuildContext context) {
    String buttonText =
        'Proceed to Payment ₹${widget.totalPrice.toStringAsFixed(2)}';

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPaymentMethodSelector(),
            SizedBox(height: 20),
            _buildPaymentMethodUI(),
            SizedBox(height: 20),
            Text(
              'Total Amount: ₹${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to process payment based on _selectedMethod
                if (_selectedMethod == PaymentMethod.UPI) {
                  _processUPIPayment();
                } else {
                  _processCardPayment();
                }
              },
              child: Text(buttonText, style: TextStyle(fontSize: 18)),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text('UPI'),
          selected: _selectedMethod == PaymentMethod.UPI,
          onSelected: (selected) {
            setState(() {
              _selectedMethod = PaymentMethod.UPI;
            });
          },
        ),
        SizedBox(width: 20),
        ChoiceChip(
          label: Text('Card'),
          selected: _selectedMethod == PaymentMethod.Card,
          onSelected: (selected) {
            setState(() {
              _selectedMethod = PaymentMethod.Card;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPaymentMethodUI() {
    if (_selectedMethod == PaymentMethod.UPI) {
      return _buildUPIPaymentUI();
    } else {
      return _buildCardPaymentUI();
    }
  }

  Widget _buildUPIPaymentUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'UPI Payment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter UPI ID',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        // Add any additional fields or widgets for UPI payment
      ],
    );
  }

  Widget _buildCardPaymentUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Card Payment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        // Add any additional fields or widgets for Card payment
      ],
    );
  }

  void _processUPIPayment() {
    // Implement logic to handle UPI payment
    // This could involve API calls, processing, etc.
    // Example: Show success/failure message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('UPI Payment'),
          content: Text('Processing UPI Payment...'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _processCardPayment() {
    // Implement logic to handle Card payment
    // This could involve API calls, processing, etc.
    // Example: Show success/failure message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Card Payment'),
          content: Text('Processing Card Payment...'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

enum PaymentMethod {
  UPI,
  Card,
}
