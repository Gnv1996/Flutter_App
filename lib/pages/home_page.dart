import 'package:flutter/material.dart';
import 'package:my_app/model/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/theme.dart';
import './item_detail_page.dart';
import './cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Shopping App'),
          ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Trending Products',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBluishColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: CatalogModel.items.isNotEmpty
                        ? ListView.builder(
                            itemCount: CatalogModel.items.length,
                            itemBuilder: (context, index) {
                              final item = CatalogModel.items[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ItemDetailPage(item: item),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.brown
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/phone.jpg', // Use item's imgUrl for the image
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                item.desc,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: 16),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "₹${item.price}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      addToCart(item);
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartPage(),
                                                        ),
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(MyTheme
                                                                  .darkBluishColor),
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                    ),
                                                    child: Text('Add to Cart'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              backgroundColor: MyTheme.darkBluishColor,
            ),
          ),
        ],
      ),
    );
  }
}

List<CartItem> cartItems = [];

void addToCart(Item item) {
  bool alreadyInCart = false;
  for (CartItem cartItem in cartItems) {
    if (cartItem.name == item.name) {
      cartItem.quantity++;
      alreadyInCart = true;
      break;
    }
  }

  if (!alreadyInCart) {
    cartItems.add(CartItem(
      name: item.name,
      image: 'assets/images/phone.jpg', // Assuming item has an imgUrl property
      price: item.price.toDouble(), // Convert price to double if necessary
    ));
  }
}

class CartItem {
  final String name;
  final String image;
  int quantity = 1; // Initialize quantity to 1
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
  });
}
