import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../widgets/app_menu_drawer.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  static const String routeName = '/club';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(),
      backgroundColor: const Color(0xFFF4F5F9),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Text(
                'Em breve você verá aqui\nas ofertas do Clube Avalyst.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
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
          const Icon(
            Icons.local_offer_outlined,
            color: AppColors.avalystGreen,
            size: 24,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Clube Avalyst',
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
