import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200';

    // Données (pour l’instant en dur, comme sur la maquette)
    const productTitle = "Petits pois et carottes à l'étuvée avec garniture";
    const productName = 'Petits pois et carottes';
    const brandName = 'Cassegrain';

    // Scores (mock)
    const nutri = ProductNutriScore(letter: 'A');
    const nova = ProductNovaScore(group: 4);
    const green = ProductGreenScore(letter: 'D');

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EF),
      body: SafeArea(
        child: ListView(
          children: const [
            ProductHeader(
              imageUrl: imageUrl,
              productName: productName,
              brandName: brandName,
            ),
            SizedBox(height: 14),

            // Titre au-dessus du bandeau
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                productTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 14),

            // === Étape 2 : Bandeau ===
            ProductScoresBanner(
              nutriScore: nutri,
              novaScore: nova,
              greenScore: green,
            ),

            SizedBox(height: 24),

            // === Étape 3 : Données ===
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InfoRow(label: 'Quantité', value: '200g (égoutté 130g)'),
                  InfoRow(label: 'Vendu', value: 'France', showDivider: false),
                ],
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

/// Widget réutilisable : image + carte arrondie + titre + marque
class ProductHeader extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String brandName;

  const ProductHeader({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          top: 12,
          left: 8,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  offset: Offset(0, -2),
                  color: Color(0x22000000),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E1B4B),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  brandName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/* ============================================================
   Étape 2 — BANDEAU (NutriScore + Nova + EcoScore/GreenScore)
   ============================================================ */

class ProductScoresBanner extends StatelessWidget {
  final ProductNutriScore nutriScore;
  final ProductNovaScore novaScore;
  final ProductGreenScore greenScore;

  const ProductScoresBanner({
    super.key,
    required this.nutriScore,
    required this.novaScore,
    required this.greenScore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2EEF6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Ligne du haut : NutriScore (44%) + séparateur + Nova (reste)
            Row(
              children: [
                Expanded(
                  flex: 44,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: NutriScoreWidget(score: nutriScore),
                  ),
                ),
                const SizedBox(
                  height: 72,
                  child: AxisSeparator(axis: Axis.vertical),
                ),
                Expanded(
                  flex: 56,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: NovaScoreWidget(score: novaScore),
                  ),
                ),
              ],
            ),

            const AxisSeparator(axis: Axis.horizontal),

            // Ligne du bas : EcoScore / GreenScore
            Padding(
              padding: const EdgeInsets.all(14),
              child: GreenScoreWidget(score: greenScore),
            ),
          ],
        ),
      ),
    );
  }
}

/// Séparateur réutilisable (Axis horizontal/vertical) comme demandé dans le TP
class AxisSeparator extends StatelessWidget {
  final Axis axis;

  const AxisSeparator({super.key, required this.axis});

  @override
  Widget build(BuildContext context) {
    final color = Colors.black.withOpacity(0.08);

    if (axis == Axis.horizontal) {
      return Container(height: 1, width: double.infinity, color: color);
    }
    return Container(width: 1, height: double.infinity, color: color);
  }
}

/// 3 widgets séparés + paramètre objet (TP)

class NutriScoreWidget extends StatelessWidget {
  final ProductNutriScore score;

  const NutriScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nutri-Score',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Color(0xFF1E1B4B),
          ),
        ),
        const SizedBox(height: 10),

        // OPTION A (si tu as une image asset, décommente et mets le bon nom)
        // Image.asset('assets/nutriscore_${score.letter.toLowerCase()}.png', height: 40),

        // OPTION B : fallback simple (badge lettre)
        _NutriBadge(letter: score.letter),
      ],
    );
  }
}

class _NutriBadge extends StatelessWidget {
  final String letter;

  const _NutriBadge({required this.letter});

  Color _colorForLetter(String l) {
    switch (l.toUpperCase()) {
      case 'A':
        return const Color(0xFF2E7D32);
      case 'B':
        return const Color(0xFF7CB342);
      case 'C':
        return const Color(0xFFF9A825);
      case 'D':
        return const Color(0xFFEF6C00);
      case 'E':
      default:
        return const Color(0xFFC62828);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _colorForLetter(letter),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        letter.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    );
  }
}

class NovaScoreWidget extends StatelessWidget {
  final ProductNovaScore score;

  const NovaScoreWidget({super.key, required this.score});

  String _novaText(int g) {
    switch (g) {
      case 1:
        return 'Aliments non transformés\nou transformés minimalement';
      case 2:
        return 'Ingrédients culinaires\ntransformés';
      case 3:
        return 'Aliments transformés';
      case 4:
      default:
        return 'Produits alimentaires et\nboissons ultra-transformés';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Groupe NOVA',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Color(0xFF1E1B4B),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _novaText(score.group),
          style: const TextStyle(
            color: Color(0xFF9CA3AF),
            height: 1.25,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class GreenScoreWidget extends StatelessWidget {
  final ProductGreenScore score;

  const GreenScoreWidget({super.key, required this.score});

  String _greenText(String l) {
    switch (l.toUpperCase()) {
      case 'A+':
      case 'A':
        return 'Très faible impact environnemental';
      case 'B':
        return 'Faible impact environnemental';
      case 'C':
        return 'Impact modéré sur l’environnement';
      case 'D':
        return 'Impact environnemental élevé';
      case 'E':
        return 'Impact environnemental très élevé';
      case 'F':
      default:
        return 'Impact environnemental très élevé';
    }
  }

  IconData _leafIcon(String l) {
    // simple : on change l'icône selon la note (tu peux ajuster)
    if (l.toUpperCase().startsWith('A')) return Icons.eco;
    if (l.toUpperCase() == 'B') return Icons.eco_outlined;
    return Icons.local_fire_department; // impact fort
  }

  Color _iconColor(String l) {
    if (l.toUpperCase().startsWith('A')) return const Color(0xFF2E7D32);
    if (l.toUpperCase() == 'B') return const Color(0xFF7CB342);
    if (l.toUpperCase() == 'C') return const Color(0xFFF9A825);
    if (l.toUpperCase() == 'D') return const Color(0xFFEF6C00);
    return const Color(0xFFC62828);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(_leafIcon(score.letter), color: _iconColor(score.letter), size: 26),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'EcoScore',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Color(0xFF1E1B4B),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _greenText(score.letter),
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* ==================================
   Étape 3 — DONNÉES (Quantité / Vendu)
   ================================== */

class InfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final bool showDivider;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = (value != null && value!.trim().isNotEmpty);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E1B4B),
                  ),
                ),
              ),
              if (hasValue)
                Text(
                  value!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
            ],
          ),
        ),
        if (showDivider && hasValue)
          Container(
            height: 1,
            color: Colors.black.withOpacity(0.08),
          ),
      ],
    );
  }
}

/* ======================
   Modèles simples (TP)
   ====================== */

class ProductNutriScore {
  final String letter; // A, B, C, D, E
  const ProductNutriScore({required this.letter});
}

class ProductNovaScore {
  final int group; // 1..4
  const ProductNovaScore({required this.group});
}

class ProductGreenScore {
  final String letter; // A+, A, B, C, D, E, F
  const ProductGreenScore({required this.letter});
}
