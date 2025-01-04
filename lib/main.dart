import 'package:daudamicah/apikey.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';

// ... app stuff here
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.teal,
      ),
      useMaterial3: true,
    ),
    home: ChatPage(),
  ));
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text(
          "Micah's AI Bot",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        body: LlmChatView(
          welcomeMessage: """Good Day, Mr. Dauda Micah! 🌞
This app was proudly created by your amazing son, Wisdom Dauda. Explore your modern AI app and feel free to ask anything—it’s all here to make your day easier and more fun! 😊""",
          provider: GeminiProvider(
            history: [],
            model: GenerativeModel(
              model: 'gemini-1.5-flash',
              apiKey: APIKEY,
            ),
          ),
        ),
      );
}
