import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletionRateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color:
              Colors.grey[100], // Latar belakang putih dengan sedikit abu-abu
          borderRadius: BorderRadius.circular(20), // Sudut melengkung
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completion Rate',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800], // Warna teks abu-abu gelap
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '70%',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Warna angka tebal
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 15, // Tinggi progress bar
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue, // Warna progress bar
                    ),
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
