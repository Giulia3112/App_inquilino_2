import 'package:flutter/material.dart';

/// AppBar padrão da Avalyst, com gradiente de marca
/// e opção de botão de voltar / menu.
class AvalystTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showMenu;
  final List<Widget>? actions;

  const AvalystTopBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.showMenu = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031A70), // azul escuro Avalyst
              Color(0xFF8D65F7), // roxo Avalyst
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'GothamRounded', // segue o manual; se não tiver, cai no default
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: false,
      actions: [
        if (showMenu)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // TODO: abrir drawer / menu lateral quando existir
            },
          ),
        ...(actions ?? []),
      ],
    );
  }
}
