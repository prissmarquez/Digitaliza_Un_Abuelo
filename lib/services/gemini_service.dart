import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';

class GoyoAI {
  final String apiKey;
  late GenerativeModel _model;

  GoyoAI(this.apiKey) {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash', // El más rápido y eficiente para esto
      apiKey: apiKey,
      generationConfig: GenerationConfig(responseMimeType: 'application/json'),
    );
  }

  Future<Map<String, dynamic>> hablarConGoyo(String mensajeUsuario) async {
    final prompt = """
      [INSTRUCCIÓN DE SISTEMA: Ver "System Prompt Maestro"]
      Usuario dice: "$mensajeUsuario"
    """;

    final content = [Content.text(prompt)];
    
    try {
      final response = await _model.generateContent(content);
      final jsonResponse = jsonDecode(response.text!);
      return jsonResponse;
    } catch (e) {
      return {
        "respuesta_voz": "Perdona, abuelo, me distraje un poquito. ¿Me lo repites?",
        "nivel_estres": "bajo",
        "recordatorio_detectado": null
      };
    }
  }
}