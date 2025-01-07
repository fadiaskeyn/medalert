import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            // Medication Cards
            MedicationCard(
              time: "12.00 Pm",
              name: "Multivitamin",
              quantity: "2 Tablet",
              isActive: true,
              onChanged: (value) {
                // Handle switch toggle
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String time;
  final String name;
  final String quantity;
  final bool isActive;
  final Function(bool) onChanged;

  const MedicationCard({
    Key? key,
    required this.time,
    required this.name,
    required this.quantity,
    required this.isActive,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Time and Icon
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Pm",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/alarm_drug.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Quantity and Switch
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  valueFontSize: 12.0,
                  toggleSize: 18.0,
                  value: isActive,
                  borderRadius: 30.0,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  onToggle: onChanged,
                ),
                SizedBox(height: 8),
                Text(
                  quantity,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
