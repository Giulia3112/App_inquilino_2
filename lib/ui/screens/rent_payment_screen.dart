import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class RentPaymentScreen extends StatelessWidget {
  static const String routeName = '/rent-payment';

  // Por enquanto, só para demonstração:
  // false = nenhum aluguel em atraso (1ª imagem)
  // true  = com inadimplência em aberto + paga (2ª imagem)
  final bool hasOpenDebt;

  const RentPaymentScreen({
    super.key,
    this.hasOpenDebt = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAmountCard(),

                  const SizedBox(height: 24),

                  if (!hasOpenDebt) ...[
                    _buildNoDebtCard(),
                  ] else ...[
                    _buildOpenDebtSection(),
                    const SizedBox(height: 24),
                    _buildPaidDebtSection(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- HEADER ----------

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 24),
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
          // Linha com seta de voltar + título
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 4),
              const Text(
                'Pagamento do aluguel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'ALAN SERGIO DE CAMPOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contrato',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '46233',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contrato iniciado em',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '03/10/2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- CARD COM VALOR DO ALUGUEL ----------

  Widget _buildAmountCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.avalystGreen,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Valor inicial do seu aluguel e taxas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'R\$ 3.700,00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- CENÁRIO: NENHUM ALUGUEL EM ATRASO ----------

  Widget _buildNoDebtCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF00AEEF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Text(
        'Sua imobiliária não informou\nnenhum aluguel em atraso',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 1.4,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------- CENÁRIO: INADIMPLÊNCIA EM ABERTO ----------

  Widget _buildOpenDebtSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inadimplência em aberto',
          style: TextStyle(
            color: Color(0xFFE28A00),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        _DebtItemCard(
          date: '20 de dezembro de 2024',
          value: 'R\$ 1.890,00',
          statusLabel: 'Pendente',
          statusColor: const Color(0xFFFFF2D6),
          statusTextColor: const Color(0xFFE28A00),
          iconColor: const Color(0xFFE28A00),
        ),
      ],
    );
  }

  // ---------- CENÁRIO: INADIMPLÊNCIA PAGA ----------

  Widget _buildPaidDebtSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inadimplência paga',
          style: TextStyle(
            color: AppColors.avalystGreen,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        _DebtItemCard(
          date: '20 de dezembro de 2024',
          value: 'R\$ 1.890,00',
          statusLabel: 'Pago',
          statusColor: const Color(0xFFE6F8E7),
          statusTextColor: AppColors.avalystGreen,
          iconColor: AppColors.avalystGreen,
        ),
        const SizedBox(height: 8),
        _DebtItemCard(
          date: '10 de novembro de 2024',
          value: 'R\$ 1.890,00',
          statusLabel: 'Pago',
          statusColor: const Color(0xFFE6F8E7),
          statusTextColor: AppColors.avalystGreen,
          iconColor: AppColors.avalystGreen,
        ),
      ],
    );
  }
}

class _DebtItemCard extends StatelessWidget {
  final String date;
  final String value;
  final String statusLabel;
  final Color statusColor;
  final Color statusTextColor;
  final Color iconColor;

  const _DebtItemCard({
    required this.date,
    required this.value,
    required this.statusLabel,
    required this.statusColor,
    required this.statusTextColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: statusTextColor.withOpacity(0.4),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF203555),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Valor informado',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF203555),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              statusLabel,
              style: TextStyle(
                color: statusTextColor,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
