import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movil_/Paciente/detalle_clinica.dart';

class ClinicasScreen extends StatelessWidget {
  const ClinicasScreen({super.key});

  static const List<Map<String, dynamic>> clinicas = [
    {
      "nombre": "Clínica Los Ángeles",
      "descripcion": "Clínica especializada en endocrinología",
      "especialidad": "Endocrinología",
      "ubicacion": "Apizaco, Calle Morelos #25",
      "horario": "08:00 - 17:00",
      "rating": 4.3,
      "reseñas": 100,
      "imagen": "assets/images/clinica.jpeg"
    },
    {
      "nombre": "Clínica San José",
      "descripcion": "Clínica especializada en neurología",
      "especialidad": "Neurología",
      "ubicacion": "Zacatelco, Calle Juárez #12",
      "horario": "08:00 - 17:00",
      "rating": 4.0,
      "reseñas": 70,
      "imagen": "assets/images/clinica.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Buscador
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Iconsax.search_normal),
                hintText: "Buscar clínica",
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 18),
          const Text(
            "Clínicas",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 12),

          // Lista de clínicas
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: clinicas.length,
            itemBuilder: (context, index) {
              final c = clinicas[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen superior
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        c['imagen'],
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Contenido del card
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título
                          Text(
                            c['nombre'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            c['descripcion'],
                            style: const TextStyle(fontSize: 14),
                          ),

                          const SizedBox(height: 12),

                          // Calificacion
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20),
                              const SizedBox(width: 5),
                              Text(
                                "${c['rating']}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "(${c['reseñas']} reseñas)",
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Información
                          Text("Especialidad: ${c['especialidad']}"),
                          Text("Ubicación: ${c['ubicacion']}"),
                          Text("Horarios: ${c['horario']}"),

                          const SizedBox(height: 12),

                          // Botón Agendar
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff4f75ff),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetalleClinicaScreen(clinica: c),
                                  ),
                                );
                              },
                              child: const Text(
                                "Agendar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
