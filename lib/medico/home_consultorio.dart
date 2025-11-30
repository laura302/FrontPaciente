import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movil_/medico/agregar_consultorio.dart';
import '../theme/app_colors.dart';
import 'editar_consultorio.dart';

class HomeConsultorioScreen extends StatelessWidget {
  const HomeConsultorioScreen({super.key});

  static const Map<String, dynamic> consultorio = {
    "nombre": "Consultorio Médico Los Pinos",
    "descripcion": "Atención general y seguimiento clínico",
    "especialidad": "Medicina General",
    "ubicacion": "Apizaco, Calle Reforma #102",
    "horario": "09:00 - 18:00",
    "rating": 4.7,
    "reseñas": 56,
    "imagen": "assets/images/clinica.jpeg"
  };

  @override
  Widget build(BuildContext context) {
    final c = consultorio;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddConsultorioScreen()),
                  );
                },
                icon: const Icon(Iconsax.add),
                label: const Text(
                  "Agregar consultorio",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Mi consultorio",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 16),


            Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 12,
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
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      c["imagen"],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Contenido
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c["nombre"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          c["descripcion"],
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.textLight,
                          ),
                        ),

                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 22),
                            const SizedBox(width: 6),
                            Text(
                              "${c['rating']}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              "   (${c['reseñas']} reseñas)",
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        _infoText("Especialidad", c["especialidad"]),
                        _infoText("Ubicación", c["ubicacion"]),
                        _infoText("Horario", c["horario"]),

                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // 🟦 Botón EDITAR
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarConsultorioScreen(
                                      consultorio: c, 
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Editar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                            const SizedBox(width: 10),


                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Eliminar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        "• $label: $value",
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}
