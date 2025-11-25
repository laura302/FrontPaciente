import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetalleClinicaScreen extends StatefulWidget {
  final Map<String, dynamic> clinica;

  const DetalleClinicaScreen({super.key, required this.clinica});

  @override
  State<DetalleClinicaScreen> createState() => _DetalleClinicaScreenState();
}

class _DetalleClinicaScreenState extends State<DetalleClinicaScreen> {
  DateTime _selectedDay = DateTime.now();
  TimeOfDay? _selectedTime;

  /// hora
  Future<TimeOfDay?> seleccionarHora() async {
    int hour = TimeOfDay.now().hour;
    int minute = TimeOfDay.now().minute - (TimeOfDay.now().minute % 5);

    return await showModalBottomSheet<TimeOfDay>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height: 280,
          child: Column(
            children: [
              // PARTE SUPERIOR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Text("Cancelar",
                          style: TextStyle(color: Colors.red)),
                      onTap: () => Navigator.pop(context),
                    ),
                    GestureDetector(
                      child: const Text("Aceptar",
                          style: TextStyle(color: Color(0xff4f75ff),
                          fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.pop(
                          context,
                          TimeOfDay(hour: hour, minute: minute),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // RUEDAS DE SELECCIÓN
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        scrollController: FixedExtentScrollController(initialItem: hour),
                        onSelectedItemChanged: (value) {
                          hour = value;
                        },
                        children: List.generate(
                          24,
                          (i) => Center(
                            child: Text(
                              i.toString().padLeft(2, '0'),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        scrollController:
                            FixedExtentScrollController(initialItem: minute ~/ 5),
                        onSelectedItemChanged: (value) {
                          minute = value * 5;
                        },
                        children: List.generate(
                          12,
                          (i) => Center(
                            child: Text(
                              (i * 5).toString().padLeft(2, '0'),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
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
    );
  }

  /// WIDGET DISPONIBILIDAD
  Widget _chipDisponibilidad(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// CALENDARIO 
  Widget _buildCalendar() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 14, // dos semanas
        itemBuilder: (_, index) {
          final day = DateTime.now().add(Duration(days: index));
          final isSelected =
              day.year == _selectedDay.year &&
              day.month == _selectedDay.month &&
              day.day == _selectedDay.day;

          return GestureDetector(
            onTap: () => setState(() => _selectedDay = day),
            child: Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff4f75ff) : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff4f75ff)
                      : Colors.grey.shade300,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"][day.weekday % 7],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clinica = widget.clinica;

    return Scaffold(
      backgroundColor: const Color(0xfff5f7ff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff4f75ff),
        title: Text(
          clinica['nombre'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff4f75ff),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// IMAGEN
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.asset(
                clinica['imagen'],
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 15),

            /// TARJETA PRINCIPAL
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// RATING
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        final rating = clinica['rating'];
                        return Icon(
                          Icons.star,
                          size: 22,
                          color: i < rating ? Colors.amber : Colors.grey[300],
                        );
                      }),
                      const SizedBox(width: 6),
                      Text(
                        "(${clinica['reseñas']} reseñas)",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    clinica['nombre'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    clinica['descripcion'],
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 14),

                  /// UBICACIÓN
                  Row(
                    children: [
                      const Icon(Iconsax.location,
                          color: Color(0xff4f75ff), size: 20),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          clinica['ubicacion'],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// DISPONIBILIDAD
                  const Text(
                    "Disponibilidad",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 10,
                    children: [
                      _chipDisponibilidad("Disponible", Colors.green),
                      _chipDisponibilidad("Poca", Colors.orange),
                      _chipDisponibilidad("No disponible", Colors.red),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// CALENDARIO
                  const Text(
                    "Selecciona un día",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  _buildCalendar(),

                  const SizedBox(height: 20),

                  /// HORARIO
                  const Text(
                    "Selecciona una hora",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () async {
                      final hora = await seleccionarHora();
                      if (hora != null) {
                        setState(() => _selectedTime = hora);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xfff0f3ff),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _selectedTime == null
                            ? "Seleccionar hora"
                            : _selectedTime!.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// BOTÓN AGENDAR
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A86B6),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Agendar cita",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ///COMENTARIOS 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Opiniones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("⭐  Excelente servicio"),
                        SizedBox(height: 4),
                        Text(
                          "La clínica es muy profesional, los doctores explican todo con detalle.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
