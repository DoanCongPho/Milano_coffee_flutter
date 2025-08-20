import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin chi tiết'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            Image.asset(
              'assets/images/banner4.png', // Đổi đúng path ảnh
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Padding content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('''
MILANO COFFEE mở ra chương trình khuyến mãi hấp dẫn "LÀM CHỦ CỬA HÀNG G1 MILANO COFFEE – NHẬN ƯU ĐÃI 10 TRIỆU ĐỒNG" dành cho Quý Khách hàng tại ba tỉnh Đà Nẵng, Quảng Nam và Quảng Ngãi.

Chương trình triển khai với mong muốn tạo cơ hội sở hữu mô hình kinh doanh hiện đại cho các nhà đầu tư và hướng tới mối quan hệ hợp tác cùng phát triển trong thời kỳ “bình thường mới”.

Về MILANO COFFEE:
Được biết đến với thương hiệu “cà phê cóc bình dân”, ngoài việc tập trung đầu tư vào chất lượng cà phê “sạch” và các nhóm thức uống khác, MILANO COFFEE còn chú trọng chọn lọc và xây dựng các mô hình cửa hàng với không gian mở, phù hợp với xu hướng kinh doanh hiện đại, đáp ứng nhu cầu của khách hàng.

Bên cạnh đó, MILANO COFFEE hướng đến sự phát triển bền vững, hỗ trợ và đồng hành cùng Quý Đại lý trong quá trình hợp tác, giúp kinh doanh hiệu quả với các chính sách quyền lợi và chương trình kích cầu, quảng bá cũng như hỗ trợ truyền thông qua từng giai đoạn.

Chi tiết thông tin chương trình:
Đại dịch Covid-19 gây ảnh hưởng lớn đến nền kinh tế và các cơ sở kinh doanh truyền thống. Tuy nhiên, thời kỳ “bình thường mới” đã được thiết lập lại, tạo đòn bẩy cho sự phát triển của các hình thức kinh doanh cũng như tăng nhu cầu tiêu dùng trong tương lai.

Tháng 11 này nhằm tạo cơ hội đầu tư, MILANO COFFEE dành tặng ưu đãi hấp dẫn giảm 10 triệu đồng khi Quý Khách hàng mở mô hình tiêu chuẩn G1.

Đây sẽ là cơ hội hấp dẫn để Quý Khách hàng sở hữu cửa hàng kinh doanh riêng mình và đồng hành hợp tác cùng MILANO COFFEE.

🗓 Thời gian chương trình: Từ 10/11 đến hết ngày 30/11/2021.
📍 Áp dụng cho mô hình nhượng quyền tiêu chuẩn G1 tại 3 tỉnh: Đà Nẵng, Quảng Nam và Quảng Ngãi.
✅ Áp dụng khi Quý khách hàng ký hợp đồng trước ngày 30/11/2021 và tiến hành thi công trong quý IV/2021.

📞 Để biết thêm thông tin chi tiết về chương trình, Quý Khách vui lòng liên hệ Hotline 1900 636 873 – nhấn phím 1.

MILANO COFFEE trân trọng cảm ơn!
          ''', style: TextStyle(fontSize: 16, height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
