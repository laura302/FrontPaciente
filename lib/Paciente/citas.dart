import 'package:flutter/material.dart';

class CitasScreen extends StatelessWidget {
  const CitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            "Mis citas agendadas",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          _citaCard(
            context,
            image: "assets/images/clinica.jpeg",
            titulo: "Clínica especializada en endocrinología",
            paciente: "Laura Flores Morales",
            fecha: "2025-11-25",
            hora: "16:00",
            lugar: "Apizaco, Calle Morelos #25",
            motivo: "Consulta general",
          ),

          const SizedBox(height: 20),

          _citaCard(
            context,
            image: "assets/images/clinica.jpeg",
            titulo: "Clínica especializada en neurología",
            paciente: "Ana Martínez Fernández",
            fecha: "2025-11-24",
            hora: "12:00",
            lugar: "Acuamanala",
            motivo: "Control",
          ),
        ],
      ),
    );
  }

  Widget _citaCard(BuildContext context,
      {required String image,
      required String titulo,
      required String paciente,
      required String fecha,
      required String hora,
      required String lugar,
      required String motivo}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, height: 180, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("Pendiente"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(children: [
              const Icon(Icons.person, size: 20),
              const SizedBox(width: 5),
              Text(paciente),
            ]),

            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.calendar_month, size: 20),
              const SizedBox(width: 5),
              Text(fecha),
            ]),

            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.access_time, size: 20),
              const SizedBox(width: 5),
              Text(hora),
            ]),

            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.location_on, size: 20),
              const SizedBox(width: 5),
              Text(lugar),
            ]),

            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.info, size: 20),
              const SizedBox(width: 5),
              Text(motivo),
            ]),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text("Cancelar cita"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
