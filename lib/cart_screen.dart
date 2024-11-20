import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(
        name: 'Risek Insta Powder',
        description: 'Bottle of 500 pellets',
        price: 115.0,
        quantity: 1,
        image: 'assets/images/risek.png'),
    CartItem(
        name: 'Panadol Tablet',
        description: 'Tablet of 200 pellets',
        price: 212.0,
        quantity: 1,
        image: 'assets/images/panado.png'),
    CartItem(
        name: 'GNC Triflex',
        description: 'Tablet of 300 pellets',
        price: 400.0,
        quantity: 1,
        image: 'assets/images/trif.png'),
    CartItem(
        name: 'CAC-Orange 20',
        description: 'Tablet of 100 pellets',
        price: 315.0,
        quantity: 1,
        image: 'assets/images/cac.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Your cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('${_cartItems.length} Items in your cart'),
                const SizedBox(
                  width: 120,
                ),
                const Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Add more',
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(index);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Payment Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      _getTotalPrice().toStringAsFixed(2),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items Discount',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text('-32.60'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Discount',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '-12.10',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text('Free'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    '_________________________________________________________'),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs. ${(_getTotalPrice() - 32.60 - 12.10).toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Order Processed')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Proceed Order',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final item = _cartItems[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.image,
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(item.description),
                    const SizedBox(height: 8),
                    Text(
                        'Rs.${(item.price * item.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15)),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.grey,
                          size: 27,
                        )),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              }
                            });
                          },
                          icon: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 165, 212, 250)),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.blue,
                            ),
                          )),
                      Text(
                        item.quantity.toString(),
                        style: const TextStyle(fontSize: 17),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                          icon: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Text(
              '_________________________________________________________'),
        ],
      ),
    );
  }

  double _getTotalPrice() {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class CartItem {
  final String name;
  final String description;
  final double price;
  int quantity;
  String image;

  CartItem(
      {required this.name,
      required this.description,
      required this.price,
      this.quantity = 1,
      required this.image});
}
