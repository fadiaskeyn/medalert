import 'package:flutter/material.dart';
import 'package:medalert/widgets/bottom_navigation.dart';

class GeneralSettingsPage extends StatefulWidget {
  @override
  _GeneralSettingsPageState createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  bool isNotificationEnabled = true;
  double notificationVolume = 50.0;
  String selectedNotificationSound = 'Default (sunday morning)';
  String selectedVibration = 'Sedang';
  String selectedTheme = 'Terang';

  final int _currentIndex = 3;

  final List<String> _routes = ['/home', '/outlook', '/suggestion', '/setting'];

  void _onTap(BuildContext context, int index) {
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Pengaturan Umum",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifikasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifikasi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: isNotificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNotificationEnabled = value;
                    });
                  },
                ),
              ],
            ),
            if (isNotificationEnabled) ...[
              Row(
                children: [
                  Icon(Icons.volume_up, color: Colors.blue),
                  Expanded(
                    child: Slider(
                      value: notificationVolume,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          notificationVolume = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),

            // Suara Notifikasi
            Text(
              "Suara Notifikasi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedNotificationSound,
              items: [
                'Default (sunday morning)',
                'Chime',
                'Alert',
              ].map((String sound) {
                return DropdownMenuItem<String>(
                  value: sound,
                  child: Text(sound),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedNotificationSound = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Getar
            Text(
              "Getar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedVibration,
              items: [
                'Sedang',
                'Lemah',
                'Kuat',
              ].map((String vibration) {
                return DropdownMenuItem<String>(
                  value: vibration,
                  child: Text(vibration),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedVibration = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tampilan (Tema)
            Text(
              "Tampilan (Tema)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedTheme,
              items: [
                'Terang',
                'Gelap',
              ].map((String theme) {
                return DropdownMenuItem<String>(
                  value: theme,
                  child: Text(theme),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTheme = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),

            // Footer
            Center(
              child: Text(
                "© 2024 Medalert. Semua Hak Dilindungi.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}
