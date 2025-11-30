import 'package:flutter/material.dart';
import 'home_consultorio.dart';
import 'notificaciones.dart';
import 'perfil_medico.dart';

class MainMedicoLayout extends StatefulWidget {
  const MainMedicoLayout({super.key});

  @override
  State<MainMedicoLayout> createState() => _MainMedicoLayoutState();
}

class _MainMedicoLayoutState extends State<MainMedicoLayout> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeConsultorioScreen(),
    NotificacionesPage(),
    PerfilMedico(),
  ];

  void _navigate(int index) {
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        backgroundColor: const Color(0xff6C8EBF),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/sanare.png',
              height: 32,
            ),
            const SizedBox(width: 10),
            const Text(
              'Sanare Médico',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),


      body: _pages[_index],


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _navigate,
        selectedItemColor: const Color(0xff4f75ff),
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
