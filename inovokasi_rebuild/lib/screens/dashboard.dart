import 'package:flutter/material.dart';
import 'package:inovokasi_rebuild/Theme.dart';
import 'package:inovokasi_rebuild/widgets/gas_suhu_card.dart';
import 'package:inovokasi_rebuild/widgets/gas_kelembapan_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/stats_cubit.dart';
import '../cubit/stats_state.dart';
import '../service/api_service.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isOn = false; // Default nilai awal
  void onToggle(bool value) {
    setState(() {
      _isOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBrown,
        elevation: 0,
        toolbarHeight: 1,
      ),
      body: Container(
        color: bgcuy,
        child: Column(
          children: [
            DashboardHeader(),
            DashboardBanner(),
            LampuCard(
              isOn: _isOn,
              onToggle: (value) {
                setState(() => _isOn = value);
              },
            ),
            GasAmoniaCard(),
            DashboardGrid(),
          ],
        ),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBrown,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_image.png'),
            radius: 26,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang',
                style: whitekTextStyle.copyWith(fontWeight: light),
              ),
              Text(
                'Admin',
                style: whitekTextStyle.copyWith(fontWeight: regular),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset('assets/button_settings.png'),
            iconSize: 30,
            onPressed: () {
              print('Settings clicked!');
            },
          ),
        ],
      ),
    );
  }
}

class DashboardBanner extends StatefulWidget {
  @override
  _DashboardBannerState createState() => _DashboardBannerState();
}

class _DashboardBannerState extends State<DashboardBanner> {
  List<String> listAlat = ['1', '2', '3', '4', '5']; // Tipe data List<String>
  String? selectedAlat; // Untuk menyimpan nilai yang dipilih

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkBrown, // Gunakan warna gelap sesuai darkBrown
        image: DecorationImage(
          image: AssetImage('assets/bgss.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Kualitas udara',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Gunakan warna teks putih
            ),
          ),
          SizedBox(width: 150), // Beri jarak antar elemen
          DropdownButton<String>(
            hint: Text(
              "alat",
              style: TextStyle(color: Colors.white),
            ),
            value: selectedAlat,
            items: listAlat.map((value) {
              return DropdownMenuItem<String>(
                child: Text(value, style: TextStyle(color: Colors.white)),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedAlat = value; // Simpan nilai yang dipilih
              });
            },
          ),
        ],
      ),
    );
  }
}

class LampuCard extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onToggle;

  const LampuCard({required this.isOn, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ganti gambar berdasarkan status Switch
            Image.asset(
              isOn
                  ? "assets/lamp_on.png"
                  : "assets/lamp_off.png", // Pilih gambar berdasarkan nilai isOn
              width: 120.0,
              height: 120.0,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Status Lampu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        isOn
                            ? "Hidup"
                            : "Mati", // Menampilkan status berdasarkan nilai isOn
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: 80, // Tentukan lebar
                        height: 40, // Tentukan tinggi
                        child: Switch(
                          value: isOn,
                          onChanged:
                              onToggle, // Fungsi untuk mengubah nilai isOn
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class GasAmoniaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: greyColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/amonia.png",
                width: 65.0,
                height: 65.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gas Amonia',
                    style: blackTextStyle.copyWith(fontWeight: regular),
                  ),
                  Text(
                    '30 ppm',
                    style: blackTextStyle.copyWith(
                      fontSize: 33,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          GasKelembapanCard(
            title: 'Suhu',
            kode: '°C',
            value: 90,
            color: Colors.white,
          ),
          GasSuhuCard(
            title: 'Suhu',
            kode: '°C',
            value: 25.5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class GasCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const GasCard({
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: regular),
            ),
            Text(
              '$value $unit',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
