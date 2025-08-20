import 'package:flutter/material.dart';

class Beverage {
  final String name;
  final String imagePath;

  Beverage({required this.name, required this.imagePath});
}

class BeverageCard extends StatelessWidget {
  final Beverage beverage;

  const BeverageCard({super.key, required this.beverage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(beverage.imagePath, fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          beverage.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ProductSelectionContent extends StatelessWidget {
  const ProductSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Beverage> beverages = [
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
      Beverage(name: "Cà phê sữa", imagePath: "assets/images/ca_phe_sua.png"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sản phẩm:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/combo.png",
                height: 182,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: const Alignment(0.0, 0.5),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Combo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Cà phê sữa + bánh",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: beverages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final beverage = beverages[index];
            return BeverageCard(beverage: beverage);
          },
        ),
      ],
    );
  }
}
