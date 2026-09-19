
import 'package:flutter/material.dart';

void main() => runApp(const GoZeeApp());

const yellow = Color(0xFFFFD600);
const black = Color(0xFF050505);
const green = Color(0xFF22C55E);

class GoZeeApp extends StatelessWidget {
  const GoZeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GO ZEE Delivery Partner',
      theme: ThemeData(
        scaffoldBackgroundColor: black,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: yellow),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('GO ZEE',
                        style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 8),
                    const Text('Delivery Partner',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 28),
                    const Icon(Icons.two_wheeler, size: 115, color: black),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Login Kare',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 22),
                    _field(Icons.phone_android, 'Mobile Number'),
                    const SizedBox(height: 12),
                    _field(Icons.lock_outline, 'Password', obscure: true),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MainShell()),
                        ),
                        child: const Text('Login',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(child: Text('Forgot Password?')),
                    const SizedBox(height: 12),
                    const Center(child: Text('OR')),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('New Partner Register',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Spacer(),
                    const Center(
                      child: Text('GO ZEE  •  Saath Hai, Har Safar Mein',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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

  static Widget _field(IconData icon, String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    OrdersPage(),
    EarningsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: black,
        selectedItemColor: yellow,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: yellow,
                child: Icon(Icons.person, color: black, size: 32),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,',
                        style: TextStyle(color: Colors.white70, fontSize: 16)),
                    Text('Ritik Kumar',
                        style: TextStyle(color: Colors.white, fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text('Delivery Partner',
                        style: TextStyle(color: Colors.white60)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsPage()),
                ),
                icon: const Icon(Icons.notifications_none, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _orderType(context, Icons.two_wheeler, 'Ride Orders',
                  '(Bike/Two Wheeler)', const yellow)),
              const SizedBox(width: 10),
              Expanded(child: _orderType(context, Icons.shopping_cart, 'Grocery Orders',
                  '(Delivery)', const yellow)),
            ],
          ),
          const SizedBox(height: 20),
          _card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Today Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 14),
                _SummaryRow('Completed Orders', '5'),
                _SummaryRow('Earnings', '₹650'),
                _SummaryRow('Incentive', '₹50'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text('View All Orders',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderType(BuildContext context, IconData icon, String title,
      String sub, Color color) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 42, color: black),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w900)),
          Text(sub, textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 8),
          const Text('→', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );
}

class _SummaryRow extends StatelessWidget {
  final String title, value;
  const _SummaryRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.radio_button_checked, size: 15),
          const SizedBox(width: 8),
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const Text('Orders',
                  style: TextStyle(color: Colors.white, fontSize: 28,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: ['All', 'Ride', 'Grocery'].map((t) {
              final active = t == 'All';
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: active ? yellow : Colors.white24,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(t,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: active ? black : Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          _orderCard(Icons.two_wheeler, 'Ride Order', '#RZ4587',
              'Gidhaur → Jamui', '₹45', 'Picked Up', context),
          _orderCard(Icons.shopping_cart, 'Grocery Order', '#GZ1023',
              'Gidhaur → Gidhaur', '₹82', 'Out for Delivery', context),
          _orderCard(Icons.two_wheeler, 'Ride Order', '#RZ4586',
              'Gidhaur → Bara', '₹70', 'Delivered', context),
          _orderCard(Icons.shopping_cart, 'Grocery Order', '#GZ1022',
              'Gidhaur → Gidhaur', '₹120', 'Delivered', context),
        ],
      ),
    );
  }

  Widget _orderCard(IconData icon, String title, String id, String route,
      String amount, String status, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => const TrackingPage())),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: yellow,
              child: Icon(icon, color: black),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Order ID: $id', style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(route),
                  Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: status == 'Delivered' ? green : yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(status,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: Colors.white,
        title: const Text('Order Tracking'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE7E7E7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(Icons.map, size: 120, color: Colors.grey),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF101010),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('📍 Customer Location',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Gidhaur, Ward No. 12',
                    style: TextStyle(color: Colors.white70)),
                SizedBox(height: 18),
                Text('⏱ Estimated Time',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('6 min', style: TextStyle(color: yellow, fontSize: 20,
                    fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Earnings',
              style: TextStyle(color: Colors.white, fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today's Earnings", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text('₹650',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Earn('Base Fare', '₹420'),
                _Earn('Incentive', '₹50'),
                _Earn('Tips', '₹180'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Last 7 Days',
              style: TextStyle(color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [420,560,610,480,720,650,580].map((v) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('₹$v', style: const TextStyle(fontSize: 10)),
                    const SizedBox(height: 4),
                    Container(
                      width: 22,
                      height: v / 4,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Earn extends StatelessWidget {
  final String a, b;
  const _Earn(this.a, this.b);
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(a, style: const TextStyle(color: Colors.black54)),
      const SizedBox(height: 5),
      Text(b, style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Profile',
              style: TextStyle(color: Colors.white, fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: yellow,
                child: Icon(Icons.person, color: black, size: 48),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ritik Kumar',
                      style: TextStyle(color: Colors.white, fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('+91 6201234567',
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 5),
                  Text('● Online',
                      style: TextStyle(color: green, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _item(Icons.description, 'My Documents', 'Aadhaar, Driving License'),
          _item(Icons.account_balance, 'Bank Details', 'For Payouts'),
          _item(Icons.directions_car, 'Vehicle Details', 'Bike'),
          _item(Icons.support, 'Support', 'Help & Contact'),
          _item(Icons.info_outline, 'About GO ZEE', 'Version 1.0.0'),
          const SizedBox(height: 10),
          _item(Icons.settings, 'Settings', 'App settings', onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SettingsPage()));
          }),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, String sub, {VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SwitchListTile(
            value: true,
            activeColor: green,
            onChanged: (_) {},
            title: const Text('Go Online / Offline',
                style: TextStyle(color: Colors.white)),
          ),
          _setting(Icons.notifications, 'Notifications'),
          _setting(Icons.language, 'Language', trailing: 'Hindi'),
          _setting(Icons.help_outline, 'Help & Support'),
          _setting(Icons.description, 'Terms & Conditions'),
          _setting(Icons.lock_outline, 'Privacy Policy'),
          _setting(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _setting(IconData icon, String title, {String? trailing}) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: trailing != null
            ? Text(trailing)
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: Colors.white,
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.two_wheeler, color: green),
            title: Text('New Ride Order'),
            subtitle: Text('Order #RZ4591 assigned • 2 min ago'),
          ),
          SizedBox(height: 8),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.shopping_cart, color: yellow),
            title: Text('New Grocery Order'),
            subtitle: Text('Order #GZ1024 assigned • 12 min ago'),
          ),
          SizedBox(height: 8),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.check_circle, color: green),
            title: Text('Order Delivered'),
            subtitle: Text('Order #GZ1022 completed • 35 min ago'),
          ),
          SizedBox(height: 8),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.card_giftcard, color: yellow),
            title: Text('Incentive Credited'),
            subtitle: Text('₹50 added to your wallet • 1 hr ago'),
          ),
        ],
      ),
    );
  }
}
