import 'package:flutter/material.dart';
import 'package:my_app/model/catalog.dart'; // Replace with your catalog model
import '../widgets/theme.dart';
import '../model/catalog.dart';
// Replace with your theme file

class ItemDetailPage extends StatefulWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  String selectedOption = '';
  double selectedOptionPrice = 0.0;

  // Options list with associated prices (replace with your actual options)
  List<Option> options = [
    Option(name: '1', price: 1),
    Option(name: '2', price: 2),
    Option(name: '3', price: 3),
    Option(name: '100+', price: 100),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize with the first option as default
    selectedOption = options.first.name;
    selectedOptionPrice = options.first.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Larger Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/phone.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.item.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.item.desc,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Detailed Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.item.desc1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Option Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                        selectedOptionPrice = options
                            .firstWhere(
                                (option) => option.name == selectedOption)
                            .price;
                      });
                    },
                    items: options.map((Option option) {
                      return DropdownMenuItem<String>(
                        value: option.name,
                        child: Text(option.name),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Spacer to push content to the top
            SizedBox(height: 16),
            // Bottom Row with Price and Buy Now Button
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Price
                  Text(
                    "₹${(widget.item.price * selectedOptionPrice).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Right side: Buy Now Button
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Purchase Confirmation'),
                            content: Text('Thank you for your purchase!'),
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
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Option {
  final String name;
  final double price;

  Option({required this.name, required this.price});
}
