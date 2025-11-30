import 'package:flutter/material.dart';

class PerfilMedico extends StatelessWidget {
  const PerfilMedico({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 5, offset: const Offset(0,3))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Medico", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/images/sanare.png", height: 80, width: 80),
              ),
              const SizedBox(height: 10),
              const Text("Miguel Angel Paredes Perez", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Correo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("medico1@gmail.com"),
                  SizedBox(height: 12),

                  Text("Teléfono", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("2224858093"),
                  SizedBox(height: 12),

                  Text("Fecha de nacimiento", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("2000-01-01"),
                  SizedBox(height: 12),

                  Text("Sexo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("M"),
                ],
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
                child: const Text("Usuario: medico1", style: TextStyle(fontSize: 14)),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Text("Cerrar Sesión", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
