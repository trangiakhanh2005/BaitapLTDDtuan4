import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaiTap02Screen(),
    );
  }
}

class BaiTap02Screen extends StatefulWidget {
  const BaiTap02Screen({super.key});

  @override
  State<BaiTap02Screen> createState() => _BaiTap02ScreenState();
}

class _BaiTap02ScreenState extends State<BaiTap02Screen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TrangTongQuan(),
    const TrangPhongMay(),
    const TrangThuVien(),
    const TrangKyTucXa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HUIT - Cơ Sở Vật Chất'),
        backgroundColor: const Color(0xFF005A9E),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF005A9E),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Phòng máy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Thư viện',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Ký túc xá'),
        ],
      ),
    );
  }
}

class TrangTongQuan extends StatelessWidget {
  const TrangTongQuan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1562774053-701939374585?w=600',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Trường Đại học Công Thương TP.HCM (HUIT)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF005A9E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'HUIT sở hữu khuôn viên hiện đại với đầy đủ các trang thiết bị phục vụ học tập, nghiên cứu và sinh hoạt cho sinh viên.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class TrangPhongMay extends StatelessWidget {
  const TrangPhongMay({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Hệ Thống Phòng Máy Thực Hành',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF005A9E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Trang bị hơn 1.000 máy tính cấu hình cao kết nối Internet tốc độ cao, phục vụ sinh viên thực hành lập trình và nghiên cứu công nghệ.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class TrangThuVien extends StatelessWidget {
  const TrangThuVien({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=600',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Thư Viện Trung Tâm & Trung Tâm Học Liệu',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF005A9E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Không gian học tập hiện đại, yên tĩnh với hàng chục ngàn đầu sách, tài liệu điện tử và hệ thống phòng học nhóm.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class TrangKyTucXa extends StatelessWidget {
  const TrangKyTucXa({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=600',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ký Túc Xá Sinh Viên HUIT',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF005A9E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sức chứa lớn, an ninh 24/7, đầy đủ tiện ích như canteen, sân thể thao và khu sinh hoạt chung giúp sinh viên an tâm học tập.',
            style: TextStyle(fontSize: 15, height: 1.4),
          ),
        ],
      ),
    );
  }
}
