import 'package:flutter/material.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatefulWidget {
  const ContactListApp({Key? key}) : super(key: key);

  @override
  State<ContactListApp> createState() => _ContactListAppState();
}

class _ContactListAppState extends State<ContactListApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Kontak',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ContactListScreen(
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const ContactListScreen({
    Key? key,
    required this.onThemeToggle,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> contacts = [
    Contact(
      name: 'Ahmad Rizki',
      phone: '+62 812-3456-7890',
      status: 'Online',
      statusColor: Colors.green,
    ),
    Contact(
      name: 'Siti Nurhaliza',
      phone: '+62 821-9876-5432',
      status: 'Offline',
      statusColor: Colors.grey,
    ),
    Contact(
      name: 'Budi Santoso',
      phone: '+62 813-5555-6666',
      status: 'Away',
      statusColor: Colors.orange,
    ),
    Contact(
      name: 'Dini Prabowo',
      phone: '+62 811-1111-2222',
      status: 'Online',
      statusColor: Colors.green,
    ),
    Contact(
      name: 'Eka Wijaya',
      phone: '+62 822-3333-4444',
      status: 'Offline',
      statusColor: Colors.grey,
    ),
  ];

  void _showCallDialog(String contactName, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Panggilan Keluar'),
        content: Text('Menghubungi $contactName di $phoneNumber?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Memanggil $contactName...'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Panggil'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeToggle,
            tooltip: 'Ubah tema',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(
            contact: contact,
            onCallPressed: () =>
                _showCallDialog(contact.name, contact.phone),
          );
        },
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onCallPressed;

  const ContactCard({
    Key? key,
    required this.contact,
    required this.onCallPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          // Avatar dengan indikator status
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: isDark 
                    ? Colors.blue.shade900 
                    : Colors.blue.shade100,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: isDark 
                      ? Colors.blue.shade300 
                      : Colors.blue.shade700,
                ),
              ),
              // Indikator status kecil di sudut
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: contact.statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey.shade900 : Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Nama dan informasi kontak
          title: Text(
            contact.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                contact.phone,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark 
                      ? Colors.grey.shade400 
                      : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: contact.statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    contact.status,
                    style: TextStyle(
                      fontSize: 12,
                      color: contact.statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tombol panggil di sebelah kanan
          trailing: IconButton(
            icon: const Icon(Icons.call),
            color: Colors.green,
            onPressed: onCallPressed,
            tooltip: 'Panggil ${contact.name}',
          ),
          isThreeLine: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final String status;
  final Color statusColor;

  Contact({
    required this.name,
    required this.phone,
    required this.status,
    required this.statusColor,
  });
}