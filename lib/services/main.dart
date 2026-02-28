import 'package:flutter/material.dart';
import 'gemini_service.dart';
import 'config.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goyo Test',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const GoyoScreen(),
    );
  }
}

class GoyoScreen extends StatefulWidget {
  const GoyoScreen({super.key});

  @override
  State<GoyoScreen> createState() => _GoyoScreenState();
}

class _GoyoScreenState extends State<GoyoScreen> {
  // REEMPLAZA CON TU API KEY REA
  final GoyoAI _goyo = GoyoAI('AIzaSyCaYt0rvdPPO18nqDLnfQwbgWLlwesWAno'); 
  
  final TextEditingController _controller = TextEditingController();
  String _respuestaGoyo = "Presiona el botón para hablar con Goyo";
  String _nivelEstres = "bajo";
  bool _cargando = false;

  void _enviarMensaje() async {
    if (_controller.text.isEmpty) return;

    setState(() => _cargando = true);

    // Llamada a la IA
    final resultado = await _goyo.hablarConGoyo(_controller.text);

    setState(() {
      _respuestaGoyo = resultado['respuesta_voz'];
      _nivelEstres = resultado['nivel_estres'];
      _cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prueba de Goyo (IA)")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Visualización del nivel de estrés
            Container(
              padding: const EdgeInsets.all(10),
              color: _nivelEstres == 'alto' ? Colors.red[100] : Colors.green[100],
              child: Text("Nivel de estrés detectado: $_nivelEstres", 
                style: TextStyle(color: _nivelEstres == 'alto' ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            // Burbuja de respuesta de Goyo
            Expanded(
              child: Center(
                child: _cargando 
                  ? const CircularProgressIndicator() 
                  : Text(_respuestaGoyo, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center),
              ),
            ),
            // Campo de texto para simular voz
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Escribe lo que el abuelo diría (ej: Me duele el pecho)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _enviarMensaje,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text("Enviar a Goyo"),
            ),
          ],
        ),
      ),
    );
  }
}