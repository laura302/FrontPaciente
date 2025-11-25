import 'package:flutter/material.dart';
import 'package:movil_/Paciente/home.dart';
import 'citas.dart';
import 'perfil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ClinicasScreen(),
    CitasScreen(),
    PerfilScreen(),
  ];

  void _navigateFromDrawer(int index) {
    Navigator.pop(context); // cierra el drawer
    setState(() => _selectedIndex = index);
  }

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar global 
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/sanare.png', height: 36),
            const SizedBox(width: 10),
            const Text('Sanare'),
          ],
        ),
        backgroundColor: const Color(0xff6C8EBF),
        elevation: 0,
      ),

      // Drawer global
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff6C8EBF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/sanare.png', height: 48),
                  ),
                  const SizedBox(height: 8),
                  const Text("Sanare",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () => _navigateFromDrawer(0),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Mis citas"),
              onTap: () => _navigateFromDrawer(1),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notificaciones"),
              onTap: () {
                _navigateFromDrawer(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () => _navigateFromDrawer(2),
            ),
          ],
        ),
      ),

      // Body 
      body: SafeArea(child: _pages[_selectedIndex]),

      // Bottom navigation global
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        selectedItemColor: const Color(0xff4f75ff),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Citas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
