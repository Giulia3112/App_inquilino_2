import 'package:flutter/material.dart';
import 'package:app_inquilino_2/ui/screens/components/avalyst_top_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AvalystTopBar(
        title: 'Confirme seus dados',
        showBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Nome completo')),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'CPF')),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'E-mail')),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Senha')),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Confirmar senha')),
          ],
        ),
      ),
    );
  }
}
