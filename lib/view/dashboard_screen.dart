import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [Image.asset("assets/images/Group.png"),
            Text("CabZing", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
