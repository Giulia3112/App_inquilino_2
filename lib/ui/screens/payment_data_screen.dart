// lib/ui/screens/payment_data_screen.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/app_colors.dart';
import '../widgets/app_menu_drawer.dart';

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
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(),
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.avalystGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 48,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.avalystBlueLight,
            AppColors.avalystBlueMid,
            AppColors.avalystBlueDark,
          ],
          stops: [0.0, 0.773, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.avalystGreen,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Text(
              'Dados de Pagamento',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
