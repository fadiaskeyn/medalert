import 'package:flutter/material.dart';

class SettingObatDialog extends StatefulWidget {
  @override
  _SettingObatDialogState createState() => _SettingObatDialogState();
}

class _SettingObatDialogState extends State<SettingObatDialog> {
  String? selectedDosis;
  List<String> waktuMinum = [];

  final TextEditingController jenisObatController = TextEditingController();
  final TextEditingController merkObatController = TextEditingController();
  final TextEditingController dosisObatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          SizedBox(width: 8),
          Text(
            "Setting Obat",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRoundedTextField(
                controller: jenisObatController,
                label: "Jenis Obat",
              ),
              SizedBox(height: 12),
              _buildRoundedTextField(
                controller: merkObatController,
                label: "Merk Obat",
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                itemHeight: 50,
                value: selectedDosis,
                decoration: InputDecoration(
                  labelText: "Dosis Obat",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: [
                  "1x1",
                  "2x1",
                  "3x1",
                  "4x1",
                ].map((dosis) {
                  return DropdownMenuItem(
                    value: dosis,
                    child: Text(dosis, style: TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDosis = value;
                    if (value == "1x1" || value == "2x1") {
                      waktuMinum = List.filled(
                        int.parse(value![0]),
                        "",
                      );
                    } else {
                      waktuMinum.clear();
                    }
                  });
                },
              ),
              SizedBox(height: 12),
              if (waktuMinum.isNotEmpty)
                Column(
                  children: List.generate(
                    waktuMinum.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildRoundedTextField(
                        label: "Jam Minum ${index + 1}",
                        onChanged: (value) {
                          waktuMinum[index] = value;
                        },
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  print("Jenis Obat: ${jenisObatController.text}");
                  print("Merk Obat: ${merkObatController.text}");
                  print("Dosis Obat: $selectedDosis");
                  print("Waktu Minum: $waktuMinum");
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("SIMPAN"),
              ),
              SizedBox(height: 12),
              Divider(),
              Row(
                children: [
                  Image.asset(
                    'assets/images/compe_drug.png',
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Tambah Obat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              _buildRoundedTextField(label: "Jenis Obat"),
              SizedBox(height: 12),
              _buildRoundedTextField(label: "Nama Obat"),
              SizedBox(height: 12),
              _buildRoundedTextField(label: "Dosis Obat"),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  print("Obat Baru Ditambahkan");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("TAMBAH"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required String label,
    TextEditingController? controller,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 12, vertical: 2), // Atur padding di sini
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
