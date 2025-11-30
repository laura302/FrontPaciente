import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import '../theme/app_text.dart';

class AddConsultorioScreen extends StatefulWidget {
  const AddConsultorioScreen({super.key});

  @override
  State<AddConsultorioScreen> createState() => _AddConsultorioScreenState();
}

class _AddConsultorioScreenState extends State<AddConsultorioScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _specializationController.dispose();
    _locationController.dispose();
    _hoursController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _saveConsultorio() {
    if (_nameController.text.isEmpty || _specializationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor, completa al menos el Nombre y la Especialidad.'),
          backgroundColor: AppColors.primary,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Consultorio "${_nameController.text}" agregado con éxito!'),
        backgroundColor: AppColors.primary,
      ),
    );

    Navigator.pop(context);
  }

  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),
    );
  }

  Widget _input(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(fontSize: 15, color: AppColors.textDark),
      decoration: InputDecoration(hintText: hint),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------- AppBar igual que MainMedicoLayout ----------
      appBar: AppBar(
        backgroundColor: const Color(0xff6C8EBF),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/sanare.png', height: 32),
            const SizedBox(width: 10),
            const Text(
              'Agregar Consultorio',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Registro del Consultorio", style: AppText.h1),
              const SizedBox(height: 6),
              Text("Completa los datos para registrar un nuevo consultorio.", style: AppText.body),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: AppStyles.card,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label("Nombre del Consultorio"),
                    const SizedBox(height: 6),
                    _input(_nameController, "Ej: Consultorio Central"),
                    const SizedBox(height: 18),

                    _label("Especialidad"),
                    const SizedBox(height: 6),
                    _input(_specializationController, "Ej: Cardiología Pediátrica"),
                    const SizedBox(height: 18),

                    _label("Ubicación"),
                    const SizedBox(height: 6),
                    _input(_locationController, "Ej: Col. San Benito, Av. 1"),
                    const SizedBox(height: 18),

                    _label("Horario de Atención"),
                    const SizedBox(height: 6),
                    _input(_hoursController, "Ej: Lunes a Viernes, 8:00 - 17:00"),
                    const SizedBox(height: 18),

                    _label("URL de Imagen (opcional)"),
                    const SizedBox(height: 6),
                    _input(_imageController, "https://imagen.com/foto.jpg"),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _saveConsultorio,
                  style: AppStyles.primaryButton,
                  child: Text("Guardar Consultorio", style: AppText.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
