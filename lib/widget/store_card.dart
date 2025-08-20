import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/module/auth/cubit/custom_button.dart';

class StoreCard extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String imagePath;

  const StoreCard({
    super.key,
    required this.title,
    required this.address,
    required this.distance,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4), // right & bottom shadow
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            width: 116,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_bag_outlined, size: 24),
                SizedBox(height: 8),
                Icon(Icons.navigation, size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            "Cửa hàng gần bạn nhất",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const StoreCard(
          title: "Milano Coffee",
          address: "295 Đường Thụy Khuê, Phường Bưởi,\nQuận Tây Hồ, TP Hà Nội",
          distance: "Cách đây 0.1 km",
          imagePath: "assets/images/milano.png",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            "Cửa hàng khác gần bạn",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const StoreCard(
          title: "Milano Coffee",
          address: "295 Đường Thụy Khuê, Phường Bưởi,\nQuận Tây Hồ, TP Hà Nội",
          distance: "Cách đây 0.2 km",
          imagePath: "assets/images/milano.png",
        ),
        const StoreCard(
          title: "Milano Coffee",
          address: "295 Đường Thụy Khuê, Phường Bưởi,\nQuận Tây Hồ, TP Hà Nội",
          distance: "Cách đây 0.3 km",
          imagePath: "assets/images/milano.png",
        ),
        const StoreCard(
          title: "Milano Coffee",
          address: "295 Đường Thụy Khuê, Phường Bưởi,\nQuận Tây Hồ, TP Hà Nội",
          distance: "Cách đây 0.4 km",
          imagePath: "assets/images/milano.png",
        ),
        const SizedBox(height: 12),
        CustomButton(
          text: 'Xem thêm',
          onPressed: () {
            // hành động khi bấm
          },
        ),
      ],
    );
  }
}
