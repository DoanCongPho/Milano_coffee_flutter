import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/module/detail_page/detail_page.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text(
          'Chương Trình Khuyến Mãi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.25),
        surfaceTintColor: Colors.transparent,
      ),

      body: ListView(
        padding: const EdgeInsets.only(
          top: 20,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        children: [
          PromotionCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            imagePath: 'assets/images/banner4.png',
            title: 'Giải Pháp Tối Ưu Chi Phí',
            subtitle: 'Nhận Ưu Đãi Lên Đến 10 Triệu Đồng',
            dateRange: 'Thời gian từ 01/12/2023 đến 20/12/2023',
          ),
          SizedBox(height: 12),
          PromotionCard(
            onTap: () {},
            imagePath: 'assets/images/banner5.png',
            title: 'Ưu Đãi Cuối Năm',
            subtitle: 'Giảm Ngay 15% Combo Máy Xay, Máy Pha Cà Phê',
            dateRange: 'Thời gian từ 01/12/2023 đến 20/12/2023',
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String dateRange;
  final VoidCallback onTap;

  const PromotionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.dateRange,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  width: 156,
                  height: 88,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
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
                      subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      dateRange,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
