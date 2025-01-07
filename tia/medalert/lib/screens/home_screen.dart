import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medalert/widgets/daily_chart.dart';
import 'package:medalert/widgets/medication_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:medalert/widgets/bottom_navigation.dart';
import 'package:medalert/widgets/calender_compoenent.dart';
import 'package:medalert/widgets/alarm_component.dart';
import 'package:medalert/widgets/popup/setting_obat.dart';
import 'package:medalert/widgets/popup/profile_popup.dart';
import 'package:medalert/widgets/completion.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> medicationAlarms = [
    {
      'time': '08.00 AM',
      'name': 'Vitamin D',
      'quantity': '1 Tablet',
      'isActive': false,
    },
    {
      'time': '12.00 PM',
      'name': 'Multivitamin',
      'quantity': '2 Tablet',
      'isActive': true,
    },
  ];

  void _toggleMedicationStatus(int index, bool value) {
    setState(() {
      medicationAlarms[index]['isActive'] = value;
    });
  }

  int _currentIndex = 0;

  final List<String> _routes = ['/home', '/outlook', '/suggestion', '/setting'];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Gunakan Navigator untuk berpindah halaman berdasarkan route
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Stefany!',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Good Morning',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ProfilePopup(
                              nama: "Stefany Laurencia",
                              usia: "18 Tahun",
                              jenisKelamin: "Perempuan",
                              jenisObat: "Tablet",
                              merkObat: "Paracetamol",
                              dosisObat: "3 x 1",
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape:
                            CircleBorder(), // Membuat button berbentuk lingkaran
                        padding: EdgeInsets.all(
                            0), // Hilangkan padding agar pas dengan ikon
                        backgroundColor: Colors
                            .transparent, // Warna latar belakang transparan
                        shadowColor: Colors.transparent, // Hilangkan bayangan
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white, // Warna latar belakang
                          shape: BoxShape
                              .circle, // Membuat latar berbentuk lingkaran
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // Tambahkan padding agar ikon tidak terlalu penuh
                          child: Icon(
                            Icons.person_pin,
                            size: 45,
                            color: Colors.grey, // Warna ikon
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//Calender
              CalendarComponent(),
              SizedBox(height: 12),

              // Completion Rate
              CompletionRateWidget(),

              SizedBox(height: 12),
              MedicationAlarmList(
                medicationAlarms: medicationAlarms,
                toggleMedicationStatus: _toggleMedicationStatus,
              ),

              SizedBox(height: 20),

              // Grafik Placeholder
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 200,
                child: LineChartWidget(),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        backgroundColor: Colors.green,
        onPressed: (() {
          print("Di click");
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Agar tinggi dan lebar dapat disesuaikan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width, // Panjang penuh layar
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Tinggi sesuai konten
                  children: [
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SettingObatDialog(),
                        );
                      },
                      child: Text("Pengaturan Obat"),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 125, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        print("Come on King, Lets to Your Glorys");
                        Navigator.of(context).pop();
                      },
                      child: Text("Catatan"),
                    ),
                  ],
                ),
              );
            },
          );
        }),
        child: Icon(Icons.add, size: 50, color: Colors.white),
      ),
    );
  }
}
