import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _nameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  void _continue() {
    final name = _nameCtrl.text.trim();
    final age = int.tryParse(_ageCtrl.text.trim());

    if (name.isEmpty || age == null || age <= 0 || age > 120) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor escribe tu nombre y una edad válida."),
        ),
      );
      return;
    }

    // Aquí puedes navegar o guardar en cache/local storage
    // Ejemplo:
    // Navigator.push(context, MaterialPageRoute(builder: (_) => Home(name: name, age: age)));
    debugPrint("Nombre: $name, Edad: $age");
  }

  @override
  Widget build(BuildContext context) {
    const warmBg = Color(0xFFFFF3E9);
    const cardColor = Color(0xFFFFFFFF);
    const warmAccent = Color(0xFFE07A5F); 
    const textDark = Color(0xFF2B2B2B);

    return Scaffold(
      backgroundColor: warmBg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Card(
                color: cardColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Encabezado
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFFFFE4D6),
                            child: Icon(Icons.favorite, color: warmAccent),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "¡Hola! Vamos a conocerte",
                              style: TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.w800,
                                color: textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Escribe tu nombre y tu edad para personalizar la app.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.3,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo Nombre
                      TextField(
                        controller: _nameCtrl,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20, color: textDark),
                        decoration: InputDecoration(
                          labelText: "Tu nombre",
                          hintText: "Ej. Lupita",
                          labelStyle: const TextStyle(fontSize: 18),
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: const Color(0xFFFFFAF6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Campo Edad
                      TextField(
                        controller: _ageCtrl,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _continue(),
                        style: const TextStyle(fontSize: 20, color: textDark),
                        decoration: InputDecoration(
                          labelText: "Tu edad",
                          hintText: "Ej. 72",
                          labelStyle: const TextStyle(fontSize: 18),
                          hintStyle: const TextStyle(fontSize: 18),
                          prefixIcon: const Icon(Icons.cake),
                          filled: true,
                          fillColor: const Color(0xFFFFFAF6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // Botón grande (accesible)
                      SizedBox(
                        height: 58,
                        child: ElevatedButton.icon(
                          onPressed: _continue,
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text(
                            "Continuar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: warmAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Texto pequeño, claro
                      const Text(
                        "Tip: Puedes escribir solo números en la edad.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}