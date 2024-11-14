import 'package:flutter/material.dart';

class CategoriItem extends StatelessWidget {
  const CategoriItem({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [
      {'image': 'assets/images/dantal.png', 'name': 'Dental'},
      {'image': 'assets/images/wel.png', 'name': 'Wellness'},
      {'image': 'assets/images/homeo.jpg', 'name': 'Homeo'},
      {'image': 'assets/images/eye.png', 'name': 'Eye care'}
    ];

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 110,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(items[index]['image']),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        items[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
