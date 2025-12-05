import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'rent_payment_screen.dart';

enum GuaranteeStatus {
  upToDate,
  overdue,
}

class ContractDetailsScreen extends StatelessWidget {
  const ContractDetailsScreen({
    super.key,
    this.status = GuaranteeStatus.upToDate,
  });

  static const String routeName = '/contract-details';

  final GuaranteeStatus status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  _buildStatusButton(),
                  const SizedBox(height: 24),
                  _buildPaymentHistory(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // HEADER
  // =========================================================
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 48,
        left: 20,
        right: 20,
        bottom: 24,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  'Garantia locatícia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'ALAN SERGIO DE CAMPOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Contrato',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            '46233',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Contrato iniciado em',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            '03/10/2023',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // BOTÃO DE STATUS (amarelo / azul)
  // =========================================================
  Widget _buildStatusButton() {
    final isOverdue = status == GuaranteeStatus.overdue;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: isOverdue ? const Color(0xFFFFC928) : const Color(0xFF00AEEF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isOverdue ? '😐' : '😊',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 12),
          Text(
            isOverdue ? 'Garantia em atraso' : 'Garantia em dia',
            style: TextStyle(
              color: isOverdue ? const Color(0xFF333333) : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // HISTÓRICO DE PAGAMENTOS
  // =========================================================
  Widget _buildPaymentHistory(BuildContext context) {
    final isOverdue = status == GuaranteeStatus.overdue;

    // Dados de exemplo
    final payments = isOverdue
        ? [
            _PaymentEntry(
              date: '07/10/2025',
              time: '09:16',
              description: 'Atualização da garantia em aberto',
              paymentMethod: PaymentMethod.card,
              amount: 2858.20,
              isOverdue: true,
            ),
            _PaymentEntry(
              date: '02/10/2023',
              time: '22:05',
              description: 'Valor de Ativação',
              paymentMethod: PaymentMethod.pix,
              amount: 120.00,
            ),
            _PaymentEntry(
              date: '02/10/2023',
              time: '22:05',
              description: 'Taxa Avalyst',
              paymentMethod: PaymentMethod.boleto,
              amount: 120.00,
            ),
          ]
        : [
            _PaymentEntry(
              date: '07/10/2024',
              time: '09:16',
              description: 'Atualização de pagamento',
              paymentMethod: PaymentMethod.card,
              amount: 1858.20,
            ),
            _PaymentEntry(
              date: '02/10/2023',
              time: '22:05',
              description: 'Valor de Ativação',
              paymentMethod: PaymentMethod.pix,
              amount: 120.00,
            ),
            _PaymentEntry(
              date: '02/10/2023',
              time: '22:05',
              description: 'Taxa Avalyst',
              paymentMethod: PaymentMethod.boleto,
              amount: 120.00,
            ),
          ];

    // Monta a lista de widgets manualmente para evitar erros de parênteses
    final historyWidgets = <Widget>[];

    bool firstOverdueButtonInserted = false;

    for (var i = 0; i < payments.length; i++) {
      final payment = payments[i];

      historyWidgets.add(_PaymentItem(payment: payment));

      final isFirstOverdue =
          payment.isOverdue && !firstOverdueButtonInserted;

      if (isFirstOverdue) {
        firstOverdueButtonInserted = true;
        historyWidgets.add(const SizedBox(height: 16));
        historyWidgets.add(
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.avalystGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RentPaymentScreen.routeName,
                );
              },
              child: const Text(
                'Realizar o pagamento',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }

      if (i < payments.length - 1) {
        historyWidgets.add(const SizedBox(height: 16));
      }
    }

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Histórico de pagamentos',
              style: TextStyle(
                color: Color(0xFF203555),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            ...historyWidgets,
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  // TODO: carregar mais pagamentos
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 18,
                  color: Color(0xFF999999),
                ),
                label: const Text(
                  'Carregar mais',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// MODELOS E WIDGETS DE APOIO
// =========================================================

enum PaymentMethod {
  card,
  pix,
  boleto,
}

class _PaymentEntry {
  final String date;
  final String time;
  final String description;
  final PaymentMethod paymentMethod;
  final double amount;
  final bool isOverdue;

  _PaymentEntry({
    required this.date,
    required this.time,
    required this.description,
    required this.paymentMethod,
    required this.amount,
    this.isOverdue = false,
  });
}

class _PaymentItem extends StatelessWidget {
  final _PaymentEntry payment;

  const _PaymentItem({required this.payment});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD700).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.attach_money,
            color: Color(0xFFFFD700),
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${payment.date} ${payment.time}',
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                payment.description,
                style: const TextStyle(
                  color: Color(0xFF203555),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildPaymentMethodIcon(payment.paymentMethod),
                  const SizedBox(width: 6),
                  Text(
                    _getPaymentMethodLabel(payment.paymentMethod),
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          'R\$ ${payment.amount.toStringAsFixed(2).replaceAll('.', ',')}',
          style: TextStyle(
            color: payment.isOverdue
                ? const Color(0xFFFF6B35)
                : AppColors.avalystGreen,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.card:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.avalystGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.credit_card,
            size: 14,
            color: AppColors.avalystGreen,
          ),
        );
      case PaymentMethod.pix:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.avalystGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Text(
              'X',
              style: TextStyle(
                color: AppColors.avalystGreen,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      case PaymentMethod.boleto:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.avalystGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.qr_code,
            size: 14,
            color: AppColors.avalystGreen,
          ),
        );
    }
  }

  String _getPaymentMethodLabel(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.card:
        return 'Cartão';
      case PaymentMethod.pix:
        return 'PIX';
      case PaymentMethod.boleto:
        return 'Boleto';
    }
  }
}
