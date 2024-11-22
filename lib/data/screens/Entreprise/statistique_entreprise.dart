import 'package:flutter/material.dart';

class StatistiqueEntreprise extends StatefulWidget {
  const StatistiqueEntreprise({super.key});

  @override
  State<StatistiqueEntreprise> createState() => _StatistiqueEntrepriseState();
}

class _StatistiqueEntrepriseState extends State<StatistiqueEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPerformanceCard('Nombre de campagnes actives', '5', Colors.blue),
            _buildPerformanceCard('Portée totale', '150,000 personnes', Colors.green),
            _buildPerformanceCard('Engagement moyen', '4.5% par post', Colors.orange),
            _buildPerformanceCard('ROI moyen', '2.8x', Colors.purple),
            _buildPerformanceCard('Top influenceur', 'John Doe (25,000 interactions)', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(Icons.trending_up, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}