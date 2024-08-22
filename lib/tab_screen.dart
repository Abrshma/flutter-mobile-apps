import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah Tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMK Negeri 4 - Mobile Apps'),
          backgroundColor: Color.fromARGB(255, 173, 220, 248),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Beranda'),
              Tab(icon: Icon(Icons.people), text: 'Siswa'),
              Tab(icon: Icon(Icons.person), text: 'Profil'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DashboardTab(),
            UsersTab(),
            ProfilTab(),
          ],
        ),
      ),
    );
  }
}

// Layout untuk Tab Dashboard
class DashboardTab extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.school,
      'label': 'Jurusan',
      'color': Colors.blue[100]},
    {
      'icon': Icons.book,
      'label': 'Pelajaran',
      'color': Colors.blue[100]},
    {
      'icon': Icons.assignment,
      'label': 'Tugas',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.sports_soccer,
      'label': 'Ekstrakulikuler',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.schedule,
      'label': 'Jadwal',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.phone_iphone,
      'label': 'Social Media',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.notifications,
      'label': 'Notifikasi',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.location_on,
      'label': 'Lokasi',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.phone,
      'label': 'Hubungi',
      'color': Colors.blue[100]},
    {
      'icon': Icons.settings,
      'label': 'Pengaturan',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.help,
      'label': 'Bantuan',
      'color': Colors.blue[100]
    },
    {
      'icon': Icons.info,
      'label': 'Info',
      'color': Colors.blue[100]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Jumlah item per baris
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                // Tangani ketukan pada ikon menu
                print('${item['label']} tapped');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 50.0, color: Colors.black),
                    SizedBox(height: 8.0),
                    Text(
                      item['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Layout untuk Tab User
class UsersTab extends StatelessWidget {
  final List<User> users = [
    User(firstName: 'Adam Ramdani F', email: 'Kelas : 12 PPLG 1'),
    User(firstName: 'Muhamad Yasir', email: 'Kelass : 12 PPLG 1'),
    User(firstName: 'Fadlan M.', email: 'Kelas : 12 PPLG 1'),
    User(firstName: 'Kamal Jindan A.', email: 'Kelas : 12 PPLG 1'),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang putih
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.firstName),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}

// Layout untuk Tab Profil
class ProfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(6, 239, 252, 249), // Warna latar belakang biru
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'lady-dmc.jpg'), // Ganti dengan path gambar profil
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Muhammad Abrisham Abdullah',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Email: abrishamabdullah75@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Biodata',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama Lengkap'),
              subtitle: Text('Muhammad Abrisham Abdullah'),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Tanggal Lahir'),
              subtitle: Text('10 November 2006'),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String email;

  User({required this.firstName, required this.email});
}
