import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(color: Colors.white, fontSize: 21)),
            Text(
              "Login to your vikn account",
              style: TextStyle(color: Color(0xFF838383), fontSize: 15),
            ),
            SizedBox(height: 27),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff08131E),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildTextField(
                    label: "Username",
                    controller: _userNameController,
                    icon: Icons.person,
                  ),
                  Divider(color: Color(0xff1C3347)),
                  _buildTextField(
                    label: "Password",
                    controller: _passWordController,
                    icon: Icons.key,
                    showSuffix: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 29),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Color(0xff0A9EF3)),
              child: Text("Forgotten Password?"),
            ),
            ElevatedButton(
              onPressed: () {},style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A9EF3),
            foregroundColor: Colors.white),
              child: Row(mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [Text("Sign in"), Icon(Icons.arrow_forward)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool showSuffix = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(icon),
        suffixIcon: showSuffix ? Icon(Icons.visibility) : null,
        border: InputBorder.none,
        prefixIconColor: Color(0xff0A9EF3),
        suffixIconColor: Color(0xff0A9EF3),
      ),
    );
  }
}
