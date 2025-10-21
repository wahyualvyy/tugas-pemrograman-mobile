import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Bebas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutBebas(),
    );
  }
}

class LayoutBebas extends StatelessWidget {
  const LayoutBebas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan Toko Elektronik'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section dengan Row
            Container(
              color: Colors.blue.shade700,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Aplikasi Flutter Anda',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications, color: Colors.white, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Konten Utama dengan Column
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Section
                  const Text(
                    'Fitur Utama',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Row dengan 3 Kartu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCard(
                        icon: Icons.shopping_bag,
                        label: 'Belanja',
                        color: Colors.green,
                      ),
                      _buildCard(
                        icon: Icons.favorite,
                        label: 'Favorit',
                        color: Colors.red,
                      ),
                      _buildCard(
                        icon: Icons.settings,
                        label: 'Pengaturan',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Daftar Item dengan Row dalam Column
                  const Text(
                    'Produk Terbaru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildProductItem('Laptop Gaming', '\$1.299', Icons.laptop),
                  const SizedBox(height: 10),
                  _buildProductItem('Smartphone Pro', '\$899', Icons.phone_iphone),
                  const SizedBox(height: 10),
                  _buildProductItem('Headphone Wireless', '\$199', Icons.headphones),
                  const SizedBox(height: 24),

                  // Footer Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.local_shipping, size: 28),
                            SizedBox(height: 8),
                            Text('Gratis Ongkir'),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.security, size: 28),
                            SizedBox(height: 8),
                            Text('Aman'),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.support_agent, size: 28),
                            SizedBox(height: 8),
                            Text('Dukungan'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 40),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(String title, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue, size: 40),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}