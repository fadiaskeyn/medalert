import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarComponent extends StatelessWidget {
  const CalendarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 170,
        width: 370,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF4A6DA7), // Warna biru tua seperti di gambar
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // Header dengan bulan dan dropdown
            Row(
              children: [
                // Icon kalender di sebelah kiri
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                // Text bulan dan tahun yang bisa di-tap
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        'May 2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Text "Today" di pojok kanan
                const Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Row untuk menampilkan hari dan tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(8, (index) {
                // Data untuk hari dan tanggal
                final days = [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thur',
                  'Fri',
                  'Sat',
                  'Sun'
                ];
                final dates = ['3', '4', '5', '6', '7', '8', '9', '10'];
                bool isSelected = index == 4; // Untuk Thursday (index 4)

                return Column(
                  children: [
                    // Nama hari
                    Text(
                      days[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Container untuk tanggal
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF9E9E9E)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        dates[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
