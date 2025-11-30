import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import '../theme/app_text.dart';

class EditarConsultorioScreen extends StatefulWidget {
  final Map<String, dynamic> consultorio;

  const EditarConsultorioScreen({super.key, required this.consultorio});

  @override
  State<EditarConsultorioScreen> createState() =>
      _EditarConsultorioScreenState();
}

class _EditarConsultorioScreenState extends State<EditarConsultorioScreen> {
  late TextEditingController nombreCtrl;
  late TextEditingController descripcionCtrl;
  late TextEditingController ubicacionCtrl;
  late TextEditingController horarioCtrl;

  int _index = 0;

  final Map<String, bool> dias = {
    "Lunes": false,
    "Martes": false,
    "Miércoles": false,
    "Jueves": false,
    "Viernes": false,
    "Sábado": false,
    "Domingo": false,
  };

  @override
  void initState() {
    super.initState();

    final c = widget.consultorio;
    nombreCtrl = TextEditingController(text: c['nombre'] ?? '');
    descripcionCtrl = TextEditingController(text: c['descripcion'] ?? '');
    ubicacionCtrl = TextEditingController(text: c['ubicacion'] ?? '');
    horarioCtrl = TextEditingController(text: c['horario'] ?? '');

    if (c['dias'] != null && c['dias'] is List) {
      for (final d in c['dias']) {
        if (dias.containsKey(d)) dias[d] = true;
      }
    }
  }

  @override
  void dispose() {
    nombreCtrl.dispose();
    descripcionCtrl.dispose();
    ubicacionCtrl.dispose();
    horarioCtrl.dispose();
    super.dispose();
  }

  void _guardarCambios() {
    final updated = {
      'nombre': nombreCtrl.text,
      'descripcion': descripcionCtrl.text,
      'ubicacion': ubicacionCtrl.text,
      'horario': horarioCtrl.text,
      'dias': dias.entries.where((e) => e.value).map((e) => e.key).toList(),
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Cambios guardados'),
        backgroundColor: AppColors.primary,
      ),
    );

    Navigator.of(context).pop(updated);
  }

  void _navigate(int i) {
    if (i == 0 || i == 1 || i == 2) {
      Navigator.pop(context); // vuelve al main
    }
  }

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
      filled: true,
      fillColor: AppColors.card,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.consultorio;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: const Color(0xff6C8EBF),
        elevation: 0,
        title: const Text(
          "Editar Consultorio",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  c['imagen'] ?? 'assets/images/clinica.jpeg',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: AppStyles.card,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre del consultorio", style: AppText.h2),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nombreCtrl,
                      decoration: _fieldDecoration("Ej. Clínica del Centro"),
                    ),

                    const SizedBox(height: 12),
                    Text("Descripción", style: AppText.h2),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descripcionCtrl,
                      decoration: _fieldDecoration("Breve descripción"),
                      minLines: 3,
                      maxLines: 5,
                    ),

                    const SizedBox(height: 12),
                    Text("Ubicación", style: AppText.h2),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ubicacionCtrl,
                      decoration:
                          _fieldDecoration("Calle, número, colonia"),
                    ),

                    const SizedBox(height: 12),
                    Text("Horario de atención", style: AppText.h2),
                    const SizedBox(height: 8),
                    TextField(
                      controller: horarioCtrl,
                      decoration:
                          _fieldDecoration("Ej. 09:00 - 18:00"),
                    ),

                    const SizedBox(height: 12),
                    Text("Días hábiles", style: AppText.h2),
                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: dias.keys.map((d) {
                        return FilterChip(
                          label: Text(
                            d,
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                          selected: dias[d]!,
                          onSelected: (v) => setState(() => dias[d] = v),
                          selectedColor:
                              AppColors.primary.withValues(alpha: 0.14),
                          backgroundColor: AppColors.card,
                          checkmarkColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _guardarCambios,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Guardar cambios",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Eliminar consultorio"),
                        content: const Text(
                            "¿Estás seguro de eliminar este consultorio?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context, {'eliminado': true});
                            },
                            child: const Text(
                              "Eliminar",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Eliminar consultorio",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

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
