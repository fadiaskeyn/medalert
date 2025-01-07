import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medalert/widgets/medication_card.dart';

class MedicationAlarmList extends StatelessWidget {
  final List<Map<String, dynamic>> medicationAlarms;
  final Function(int, bool) toggleMedicationStatus;

  MedicationAlarmList({
    required this.medicationAlarms,
    required this.toggleMedicationStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/images/compe_drug.png',
                width: 55,
                height: 55,
              ),
            ),
            Text(
              'Medication Alarm List',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            height: 200,
            width: 370,
            child: ListView.builder(
              itemCount: medicationAlarms.length,
              itemBuilder: (context, index) {
                final medication = medicationAlarms[index];
                return MedicationCard(
                  time: medication['time'],
                  name: medication['name'],
                  quantity: medication['quantity'],
                  isActive: medication['isActive'],
                  onChanged: (value) => toggleMedicationStatus(index, value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
