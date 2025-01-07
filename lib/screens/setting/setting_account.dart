import 'package:flutter/material.dart';
import 'package:medalert/widgets/bottom_navigation.dart';

class SettingAccount extends StatelessWidget {
  final int _currentIndex = 3;

  final List<String> _routes = ['/home', '/outlook', '/suggestion', '/setting'];

  void _onTap(BuildContext context, int index) {
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pengaturan Akun",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildFormField(
              context,
              label: "Username",
              value: "Stefany Laurencia",
            ),
            const SizedBox(height: 16),
            buildFormField(
              context,
              label: "Email",
              value: "stefanylaurencia@gmail.com",
            ),
            const SizedBox(height: 16),
            buildFormField(
              context,
              label: "No. Telp",
              value: "+62 897 4324 6780",
            ),

// Hapus Akun Section
            const SizedBox(height: 32),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hapus Akun",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Setelah akun dihapus, Seluruh data terkait akun Anda akan dihapus dari sistem.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Hapus akun logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Hapus Akun"),
                ),
              ],
            ),

            const SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: Text(
                "© 2024 Medalert. Semua Hak Dilindungi.",
                style: TextStyle(color: Colors.grey.shade600),
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

  Widget buildFormField(
    BuildContext context, {
    required String label,
    required String value,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Edit logic
                },
                icon: const Icon(Icons.edit, color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
