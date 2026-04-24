import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                "Flutter App",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.person), title: Text("Profile")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack section (Image + Text overlay)
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/600/300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  color: Colors.black.withOpacity(0.4),
                  alignment: Alignment.center,
                  child: const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Grid Dashboard
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  DashboardCard(icon: Icons.shopping_cart, title: "Orders"),
                  DashboardCard(icon: Icons.favorite, title: "Favorites"),
                  DashboardCard(icon: Icons.notifications, title: "Alerts"),
                  DashboardCard(icon: Icons.analytics, title: "Analytics"),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Reusable Card Widget
class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
