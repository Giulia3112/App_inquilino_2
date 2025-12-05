import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'send_request_success_screen.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({super.key});

  static const String routeName = '/support/send-request';

  @override
  State<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  String? _selectedSubject;

  final List<String> _subjects = [
    'Agendar visita',
    'Dúvidas sobre contrato',
    'Problemas com pagamento',
    'Outro',
  ];

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO: enviar solicitação ao backend
    Navigator.pushReplacementNamed(
      context,
      SendRequestSuccessScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.people_outline,
                                color: AppColors.avalystGreen,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Enviar solicitação',
                                style: TextStyle(
                                  color: Color(0xFF203555),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Assunto (dropdown estilizado)
                          GestureDetector(
                            onTap: () async {
                              final chosen = await showModalBottomSheet<String>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                builder: (ctx) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Selecione o assunto',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ..._subjects.map(
                                        (s) => ListTile(
                                          title: Text(s),
                                          onTap: () {
                                            Navigator.pop(ctx, s);
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  );
                                },
                              );

                              if (chosen != null) {
                                setState(() {
                                  _selectedSubject = chosen;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _selectedSubject ?? 'Assunto:*',
                                      style: TextStyle(
                                        color: _selectedSubject == null
                                            ? AppColors.textSecondary
                                            : const Color(0xFF203555),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.expand_more,
                                    color: Color(0xFF203555),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Descrição
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: TextField(
                              controller: _messageController,
                              minLines: 4,
                              maxLines: 6,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                hintText: 'Descreva sua solicitação:*',
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Anexo
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Anexo arquivo:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF203555),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.upload_file_outlined,
                                  color: AppColors.avalystBlueDark,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.avalystGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      onPressed: _submit,
                      child: const Text(
                        'Agendar visita',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
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
              const Text(
                'Envie uma solicitação',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'ALAN SERGIO DE CAMPOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
