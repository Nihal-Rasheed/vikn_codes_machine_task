import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vikn_codes/view/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splashBG.png'))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 10),
          child: SafeArea(
            child: Column(
              spacing: 5,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/icons/languageSwitchIcon.svg'),
                    Text("English", style: TextStyle( color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
                  ],
                ),
                Spacer(),
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
                    border: Border.all(color: Color(0xff1C3347))
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        label: "Username",
                        controller: _userNameController,
                        iconPath: 'assets/icons/userIcon.svg'
                        // icon: Icons.person,
                      ),
                      Divider(color: Color(0xff1C3347)),
                      _buildTextField(
                        label: "Password",
                        controller: _passWordController,
                        iconPath: 'assets/icons/passwordIcon.svg',
                        // icon: Icons.key,
                        showSuffix: true,
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 29),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Color(0xff0A9EF3)),
                  child: Text("Forgotten Password?"),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                  },style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A9EF3),
                foregroundColor: Colors.white),
                  child: Row(mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [Text("Sign in"), Icon(Icons.arrow_forward)],
                  ),
                ),

                Spacer(),
                // SizedBox(height: 168,),
                Text("Don’t have an Account?",style: TextStyle(color: Colors.white),),
                // SizedBox(height: 4, ),
                TextButton(onPressed: (){},style: TextButton.styleFrom(foregroundColor: Color(0xff0A9EF3)), child: Text("Sign up now!"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    // required IconData icon,
    required String iconPath,
    bool showSuffix = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white
        ),
        onTapOutside: (v){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10),
          isDense: true,
          prefixIconConstraints: BoxConstraints(maxHeight: 25,maxWidth: 25),
          labelText: label,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          // prefixIcon: Icon(icon),
          prefixIcon: SvgPicture.asset(iconPath),
          suffixIcon: showSuffix ? Icon(Icons.visibility) : null,
          border: InputBorder.none,
          prefixIconColor: Color(0xff0A9EF3),
          suffixIconColor: Color(0xff0A9EF3),
        ),
      ),
    );
  }
}
