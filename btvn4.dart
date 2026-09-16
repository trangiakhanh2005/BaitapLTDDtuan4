import 'package:flutter/material.dart';

void main() {
  runApp(const EWalletApp());
}

class EWalletApp extends StatelessWidget {
  const EWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Wallet UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        useMaterial3: true,
      ),
      home: const EWalletScreen(),
    );
  }
}

class EWalletScreen extends StatefulWidget {
  const EWalletScreen({super.key});

  @override
  State<EWalletScreen> createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen> {
  int _currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // Header: Title + Button Add Card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'My ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 26, color: Colors.black54),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.black87),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Card Swiper (PageView)
              SizedBox(
                height: 190,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      _currentCardIndex = index;
                    });
                  },
                  children: const [
                    _CreditCardWidget(
                      balance: '\$5250.25',
                      cardNumber: '12345678',
                      expiry: '10/24',
                      color: Color(0xFF8E64D6),
                    ),
                    _CreditCardWidget(
                      balance: '\$2840.50',
                      cardNumber: '87654321',
                      expiry: '12/26',
                      color: Color(0xFF3B82F6),
                    ),
                    _CreditCardWidget(
                      balance: '\$1200.00',
                      cardNumber: '56781234',
                      expiry: '08/25',
                      color: Color(0xFF10B981),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Page Indicator (Dấu chấm chuyển thẻ)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentCardIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentCardIndex == index
                          ? Colors.black54
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // Chức năng Send, Pay, Bills
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _ActionButton(
                    icon: Icons.unarchive_outlined,
                    iconColor: Colors.green,
                    label: 'Send',
                  ),
                  _ActionButton(
                    icon: Icons.credit_card,
                    iconColor: Colors.blue,
                    label: 'Pay',
                  ),
                  _ActionButton(
                    icon: Icons.receipt_long,
                    iconColor: Colors.orange,
                    label: 'Bills',
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Danh sách tiện ích: Statistics & Transactions
              const _FeatureTile(
                icon: Icons.bar_chart,
                iconColor: Colors.cyan,
                title: 'Statistics',
                subtitle: 'Payment and Income',
              ),
              const SizedBox(height: 14),
              const _FeatureTile(
                icon: Icons.swap_horiz,
                iconColor: Colors.green,
                title: 'Transactions',
                subtitle: 'Transaction History',
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button dạng đường tròn màu hồng nhạt ở giữa đáy
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFE91E63),
        shape: const CircleBorder(),
        child: const Icon(Icons.attach_money, color: Colors.white, size: 28),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.white,
        child: Container(height: 30),
      ),
    );
  }
}

// Widget thẻ ngân hàng (Credit Card)
class _CreditCardWidget extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final String expiry;
  final Color color;

  const _CreditCardWidget({
    required this.balance,
    required this.cardNumber,
    required this.expiry,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Balance',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 6),
              Text(
                balance,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                expiry,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget Nút thao tác nhanh (Send, Pay, Bills)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _ActionButton({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

// Widget Mục tùy chọn (Statistics, Transactions)
class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 16),
        ],
      ),
    );
  }
}
