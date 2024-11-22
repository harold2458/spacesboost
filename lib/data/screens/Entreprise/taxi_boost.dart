import 'package:flutter/material.dart';

class TaxiBoost extends StatefulWidget {
  const TaxiBoost({super.key});

  @override
  State<TaxiBoost> createState() => _TaxiBoostEntreprepriseState();
}

class _TaxiBoostEntreprepriseState extends State<TaxiBoost> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStatCard('Courses totales', '120', Colors.blue),
            _buildStatCard('Revenu total', '4,500 €', Colors.green),
            _buildStatCard('Note moyenne des clients', '4.8/5', Colors.orange),
            _buildStatCard('Kilomètres parcourus', '1,200 km', Colors.purple),
            _buildStatCard('Temps moyen d’attente', '5 minutes', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(Icons.bar_chart, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}