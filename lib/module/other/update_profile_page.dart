import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: UpdateProfilePage()));

class UpdateProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(
    text: "Phạm Đức Hải",
  );
  final TextEditingController emailController = TextEditingController(
    text: "haipd@gmail.com",
  );
  final TextEditingController dobController = TextEditingController(
    text: "25/02/1997",
  );
  final ValueNotifier<String> gender = ValueNotifier("Nam");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cập Nhật Thông Tin',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.25), // 👈 màu bóng
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black87,
                  child: Icon(Icons.person, size: 100, color: Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("Họ và tên"),
                  _buildTextField(nameController),
                  _buildLabel("Email của bạn"),
                  _buildTextField(emailController),
                  _buildLabel("Ngày tháng năm sinh"),
                  _buildDateField(context, dobController),
                  _buildLabel("Giới tính"),
                  _buildGenderDropdown(),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.black, size: 22),
              label: Text(
                "Xóa tài khoản",

                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF4C05F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "CẬP NHẬT TÀI KHOẢN",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDateField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime(1997, 2, 25),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          locale: const Locale('vi', 'VN'),
        );
        if (date != null) {
          controller.text =
              "${date.day.toString().padLeft(2, '0')}/"
              "${date.month.toString().padLeft(2, '0')}/"
              "${date.year}";
        }
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return ValueListenableBuilder<String>(
      valueListenable: gender,
      builder: (context, value, _) {
        return DropdownButtonFormField<String>(
          value: value,
          onChanged: (newValue) {
            if (newValue != null) gender.value = newValue;
          },
          items: ['Nam', 'Nữ', 'Khác'].map((label) {
            return DropdownMenuItem(value: label, child: Text(label));
          }).toList(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
      },
    );
  }
}
