import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Máy tính',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayValue = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  bool _isNewInput = true;

  final List<String> _buttons = [
    '%',
    'CE',
    'C',
    '⌫',
    '1/x',
    'x²',
    '√x',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    '.',
    '=',
  ];

  void _onButtonPressed(String btnText) {
    setState(() {
      if (btnText == 'C' || btnText == 'CE') {
        _displayValue = '0';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
        _isNewInput = true;
      } else if (btnText == '⌫') {
        if (_displayValue.length > 1) {
          _displayValue = _displayValue.substring(0, _displayValue.length - 1);
        } else {
          _displayValue = '0';
        }
      } else if (RegExp(r'^[0-9.]$').hasMatch(btnText)) {
        if (_isNewInput || _displayValue == '0') {
          _displayValue = btnText == '.' ? '0.' : btnText;
          _isNewInput = false;
        } else {
          if (btnText == '.' && _displayValue.contains('.')) return;
          _displayValue += btnText;
        }
      } else if (['+', '-', '×', '÷'].contains(btnText)) {
        _num1 = double.tryParse(_displayValue) ?? 0;
        _operator = btnText;
        _isNewInput = true;
      } else if (btnText == '=') {
        _num2 = double.tryParse(_displayValue) ?? 0;
        double result = 0;
        switch (_operator) {
          case '+':
            result = _num1 + _num2;
            break;
          case '-':
            result = _num1 - _num2;
            break;
          case '×':
            result = _num1 * _num2;
            break;
          case '÷':
            result = _num2 != 0 ? _num1 / _num2 : 0;
            break;
        }
        _displayValue = result % 1 == 0
            ? result.toInt().toString()
            : result.toString();
        _isNewInput = true;
        _operator = '';
      } else if (btnText == 'x²') {
        double val = double.tryParse(_displayValue) ?? 0;
        double result = val * val;
        _displayValue = result % 1 == 0
            ? result.toInt().toString()
            : result.toString();
        _isNewInput = true;
      } else if (btnText == '%') {
        double val = double.tryParse(_displayValue) ?? 0;
        _displayValue = (val / 100).toString();
        _isNewInput = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Row(
          children: [
            Text(
              'Standard',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.picture_in_picture_alt_outlined,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF005A9E)),
              child: Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 4),
              child: Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Color(0xFF005A9E)),
              title: const Text(
                'Standard',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.science_outlined),
              title: const Text('Scientific'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: const Text('Graphing'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Programmer'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Date calculation'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 4),
              child: Text(
                'Converter',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Currency'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.straighten),
              title: const Text('Length'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                _displayValue,
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['MC', 'MR', 'M+', 'M-', 'MS', 'M^'].map((label) {
              return TextButton(
                onPressed: () {},
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 4),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.35,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _buttons.length,
              itemBuilder: (context, index) {
                String btnText = _buttons[index];
                bool isEqual = btnText == '=';
                bool isNumber =
                    RegExp(r'^[0-9.]$').hasMatch(btnText) || btnText == '+/-';

                return ElevatedButton(
                  onPressed: () => _onButtonPressed(btnText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEqual
                        ? const Color(0xFF005A9E)
                        : (isNumber ? Colors.white : const Color(0xFFF9F9F9)),
                    foregroundColor: isEqual ? Colors.white : Colors.black87,
                    elevation: isEqual ? 2 : 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    btnText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: isEqual ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
