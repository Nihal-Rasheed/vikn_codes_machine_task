import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes/controller/landingpage_controller.dart';
import 'package:vikn_codes/controller/login_controller.dart';
import 'package:vikn_codes/service/share_pref_service.dart';
import 'package:vikn_codes/utils/app_assets.dart';
import 'package:vikn_codes/utils/app_icons.dart';
import 'package:vikn_codes/view/bottom_navigation_view.dart';
import 'package:vikn_codes/view/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();

  TextEditingController _passWordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkUserSigned();
  }

  _checkUserSigned()async{
    final token = await SharedPrefService.getAccessToken();
    if(token!= null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          LandingPage()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.splashBg))
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 10),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 5,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(AppIcons.languageSwitchIcon),
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
                          iconPath: AppIcons.userIcon,
                          validator: (input) {
                            if(input?.isEmpty??false){
                              return '*required';
                            }
                            return null;
                          },
                          // icon: Icons.person,
                        ),
                        Divider(color: Color(0xff1C3347)),
                        _buildTextField(
                          label: "Password",
                          controller: _passWordController,
                          iconPath: AppIcons.passwordIcon,
                          // icon: Icons.key,
                          showSuffix: true,
                          validator: (input) {
                            if(input?.isEmpty??false){
                              return '*required';
                            }
                            return null;
                          },
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
                  Selector<LoginController,bool>(
                    selector: (p0, p1) => p1.isLoading,
                    builder: (context, isLoading, child) =>
                        ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState?.validate()??false){
                      context.read<LoginController>().login(
                          userName: _userNameController.text,
                          password: _passWordController.text).then((value) {
                            if(value){
                              context.read<LandingPageController>().updateBottomBar(0);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                  LandingPage()
                              ));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SomeThing went wrong')));
                            }
                          },);
                        }
                      },style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0A9EF3),
                    foregroundColor: Colors.white),
                      child:
                      isLoading?CircularProgressIndicator():
                      Row(mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [Text("Sign in"), Icon(Icons.arrow_forward)],
                      ),
                    ),
                  ),

                  Spacer(),
                  // SizedBox(height: 168,),
                  Text("Don’t have an Account?",style: TextStyle(color: Colors.white),),
                  // SizedBox(height: 4, ),
                  TextButton(
                      onPressed: (){},style: TextButton.styleFrom(foregroundColor: Color(0xff0A9EF3)),
                      child: Text("Sign up now!"))
                ],
              ),
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
    String? Function(String?)? validator,
    bool showSuffix = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        style: TextStyle(
          color: Colors.white
        ),
        onTapOutside: (v){
          FocusManager.instance.primaryFocus!.unfocus();
        },
          obscureText:showSuffix,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10),
          isDense: true,
          prefixIconConstraints: BoxConstraints(maxHeight: 25,maxWidth: 25),
          labelText: label,

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
