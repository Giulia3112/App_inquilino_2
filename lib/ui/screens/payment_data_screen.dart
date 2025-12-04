// lib/ui/screens/payment_data_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class PaymentDataScreen extends StatefulWidget {
  const PaymentDataScreen({super.key});

  static const routeName = '/paymentData';

  @override
  State<PaymentDataScreen> createState() => _PaymentDataScreenState();
}

class _PaymentDataScreenState extends State<PaymentDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberCtrl = TextEditingController();
  final _holderCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();

  @override
  void dispose() {
    _cardNumberCtrl.dispose();
    _holderCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: salvar dados
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados de pagamento salvos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados de Pagamento'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Cartão de crédito',
                  style: AppTextStyles.titleMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cardNumberCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Número do cartão',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value == null || value.length < 12 ? 'Número inválido' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _holderCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nome impresso no cartão',
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Validade (MM/AA)',
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Informe a validade' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvCtrl,
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value == null || value.length < 3 ? 'CVV inválido' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _save,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

