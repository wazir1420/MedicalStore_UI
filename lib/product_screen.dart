import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/risek.png',
    'assets/images/risek.png',
    'assets/images/risek.png',
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  int _selectedIndex = -1;

  final List<Map<String, String>> packageSize = [
    {'price': 'Rs.106', 'details': '100 pallets'},
    {'price': 'Rs.166', 'details': '150 pallets'},
    {'price': 'Rs.252', 'details': '300 pallets'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: <Widget>[
                      const Icon(
                        Icons.notifications_none_outlined,
                        size: 30,
                      ),
                      Positioned(
                        right: 2,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Risek Insta Powder 20/1100 mg',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Risek Insta Powder contains Omeprazole '),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 150,
                width: 370,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.asset(
                        images[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        _currentPage == index ? Colors.black : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Rs.199',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20,
                              color: Colors.grey.shade600),
                        ),
                        const Text(
                          'Rs.115',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Text('Ettiom mollis')
                  ],
                ),
                const SizedBox(
                  width: 125,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 1,
                width: 370,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Package size',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                  children: List.generate(packageSize.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.grey.shade300,
                        border: Border.all(
                          color: _selectedIndex == index
                              ? Colors.amber
                              : Colors.grey.shade800,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              packageSize[index]['price']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _selectedIndex == index
                                    ? Colors.amber
                                    : Colors.grey.shade800,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              packageSize[index]['details']!,
                              style: TextStyle(
                                color: _selectedIndex == index
                                    ? Colors.amber
                                    : Colors.grey.shade800,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Produt Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Risek Insta Powder 20/1100 mg 10 Sachet works by decreasing the amount of acid your stomach makes. It belongs to a class of drugs known as proton pump inhibitors (PPIs). It is an antacid that reduces stomach acid and helps omeprazole to work better. ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Risek Insta contains immediate-release formulation of omeprazole and sodium bicarbonate. Sodium bicarbonate raises the gastric pH and thus protect omeprazole from acid degradation. ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '25/12/2024',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Brand Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Omeprazole',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        '4.4',
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.yellow, size: 32),
                    ],
                  ),
                  const Text(
                    '923 Ratings and 257 Reviews',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  for (var entry in _ratingData.entries)
                    _buildRatingRow(entry.key, entry.value),
                ],
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  '4.2',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 240,
                ),
                Text(
                  '05-oct-2023',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Abdullah Khan',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "I recently tried Risek Insta Powder, and it has exceeded all my expectations. The 20/1100 mg formula in these sachets is truly effective and works wonders for quick relief. Whether it's heartburn, acid reflux, or stomach discomfort, this product provides noticeable results almost instantly.",
              ),
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  '4.8',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 240,
                ),
                Text(
                  '09-dec-2023',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hamza Naeem',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "I recently tried Risek Insta Powder, and it has exceeded all my expectations. The 20/1100 mg formula in these sachets is truly effective and works wonders for quick relief. Whether it's heartburn, acid reflux, or stomach discomfort, this product provides noticeable results almost instantly.",
              ),
            )
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        left: 20,
        right: 20,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to Card')),
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
            'Add to Cart',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      )
    ]));
  }
}

Widget _buildRatingRow(int star, double percentage) {
  return Row(
    children: [
      Text('$star'),
      const Icon(Icons.star, size: 16, color: Colors.yellow),
      const SizedBox(width: 8),
      Expanded(
        child: LinearProgressIndicator(
          value: percentage,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
      ),
      const SizedBox(width: 8),
      Text('${(percentage * 100).toStringAsFixed(0)}%'),
    ],
  );
}

final Map<int, double> _ratingData = {
  5: 0.67,
  4: 0.20,
  3: 0.07,
  2: 0.00,
  1: 0.02,
};
