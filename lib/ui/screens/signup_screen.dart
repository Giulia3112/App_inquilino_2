import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Fundo em degradê azul
          Container(
            height: size.height * 0.48,
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
            ),
          ),

          // Card branco inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.62,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- BOTÃO VOLTAR ----------
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).maybePop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: AppColors.avalystGreen,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Voltar',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.avalystGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Confirme seus dados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _buildTextField(
                      label: 'Nome completo',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 12),

                    _buildTextField(
                      label: 'CPF',
                      controller: _cpfController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),

                    _buildTextField(
                      label: 'E-mail',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),

                    _buildTextField(
                      label: 'Senha',
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.avalystGreen,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildTextField(
                      label: 'Confirmar senha',
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.avalystGreen,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword =
                                !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ---------- BOTÃO CADASTRAR ----------
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
                        onPressed: () {
                          // Por enquanto, após "cadastrar" vai para o shell principal (Home + tabs)
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/main-shell', // precisa estar registrado no main.dart
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
          borderSide: BorderSide(
            color: AppColors.avalystGreen,
            width: 1.5,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
