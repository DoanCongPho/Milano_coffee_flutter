import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Tức'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            Image.asset(
              'assets/images/banner3.png', // Đổi đúng path ảnh
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Padding content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'RA MẮT ĐẠI SỨ THƯƠNG HIỆU MILANO –\nTRIATHLON NGUYỄN THỊ KIM CƯƠNG',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '''Milano Coffee hân hạnh giới thiệu VĐV Nguyễn Thị Kim Cương – nhà vô địch Triathlon đầy tài năng – trở thành đại sứ thương hiệu mới nhất của chúng tôi.

Nguyễn Thị Kim Cương là một vận động viên ba môn phối hợp (triathlon) xuất sắc với nhiều thành tích ấn tượng. Cô đã chứng minh bản lĩnh và ý chí kiên cường của mình qua hàng loạt giải đấu lớn, truyền cảm hứng cho cộng đồng yêu thể thao và những người đam mê chinh phục thử thách.

Năm 2024, Kim Cương đã khẳng định vị thế của mình với những chiến thắng vang dội tại hai giải đấu danh giá:
- Vô địch Vietnam Festival Bình Thuận 2024 với cự ly 70.3m – ba môn phối hợp gồm bơi 1.9km, đạp xe 90km và chạy bộ 21km
- Vô địch Aqua Warrior Hạ Long 2024 solo nữ với cự ly Bơi 3km – Chạy 15 km

Với tinh thần thể thao mãnh liệt, ý chí kiên cường và sự cống hiến hết mình, Kim Cương là nguồn cảm hứng cho tất cả những ai khao khát chinh phục thử thách và hướng đến thành công.

Milano Coffee vô cùng tự hào khi đồng hành cùng Nguyễn Thị Kim Cương trong hành trình chinh phục đam mê. Thành công của Nguyễn Thị Kim Cương là minh chứng cho tinh thần thể thao “Dám thử thách – Dám chinh phục” mà Milano Coffee luôn hướng đến.

Hãy cùng Milano chung tay cổ vũ cho Kim Cương trong những thử thách tiếp theo!''',
                    style: TextStyle(fontSize: 15, height: 1.6),
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
