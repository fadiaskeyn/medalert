import 'package:flutter/material.dart';
import 'package:medalert/widgets/bottom_navigation.dart';

class Outlook extends StatelessWidget {
  final int _currentIndex = 1;

  final List<String> _routes = ['/home', '/outlook', '/suggestion', '/setting'];

  void _onTap(BuildContext context, int index) {
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> insights = [
      {
        "title": "Diabetes Type 2",
        "image": "assets/images/complications/cancer.png"
      },
      {
        "title": "Jantung Koroner",
        "image": "assets/images/complications/jantung_koroner.png"
      },
      {
        "title": "Demensia",
        "image": "assets/images/complications/demensia.png"
      },
      {"title": "Liver", "image": "assets/images/complications/liver.png"},
      {"title": "Kanker", "image": "assets/images/complications/cancer.png"},
      {"title": "PCOS", "image": "assets/images/complications/PCOS.png"},
      {
        "title": "Hipertensi",
        "image": "assets/images/complications/hipertensi.png"
      },
      {
        "title": "Dislipidemia",
        "image": "assets/images/complications/dislipedemia.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wawasan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Health Insight",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Informasi penting untuk menjaga kesehatan Anda dengan lebih baik",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                itemCount: insights.length,
                itemBuilder: (context, index) {
                  final insight = insights[index];
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Info tentang ${insight['title']}"),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            insight['image']!,
                            height: 60,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            insight['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Info lengkap",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}
