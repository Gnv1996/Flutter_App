import 'package:flutter/material.dart';
import '../model/catalog.dart';
import '../widgets/theme.dart';
import '../pages/payment_gateway_page.dart'; // Import your payment gateway page

class ItemDetailPage extends StatelessWidget {
  final Item item;

  ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/phone.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 16),
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.desc1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '₹${item.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBluishColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to payment gateway page with item and totalPrice
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentGatewayPage(
                      item: item,
                      totalPrice: item.price.toDouble(), // Cast to double
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text('Buy Now', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
