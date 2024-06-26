import 'package:flutter/material.dart';
import './home_page.dart';
import '../widgets/theme.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.quantity * cartItem.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        cartItem.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        cartItem.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Total: ₹${(cartItem.quantity * cartItem.price).toStringAsFixed(2)}'), // Display total price per item
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItem.quantity++;
                                        calculateTotalPrice();
                                      });
                                    },
                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                  Text(
                                    '${cartItem.quantity}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (cartItem.quantity > 1) {
                                          cartItem.quantity--;
                                          calculateTotalPrice();
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    cartItems.remove(cartItem);
                                    calculateTotalPrice();
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(horizontal: 20)),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(0, 0)),
                                ),
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(8.0), // Adjust padding for increased size
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Total: ₹${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to buy items or proceed to checkout
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
