import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes/service/landingpage_controller.dart';
import 'package:vikn_codes/utils/app_colors.dart';
import 'package:vikn_codes/utils/app_icons.dart';
import 'package:vikn_codes/view/dashboard_screen.dart';
import 'package:vikn_codes/view/profile_screen.dart';

class LandingPage extends StatelessWidget {
   LandingPage({super.key});

  final List<Widget> _pages = [
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Selector<LandingPageController,int>(
      selector: (p0, p1) => p1.selectedIndex,
      builder: (context, selectedIndex, child) =>
          Scaffold(

            body: _pages.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryBgColor,
          currentIndex: selectedIndex,
          onTap: (v){
           context.read<LandingPageController>().updateBottomBar(v);
          },
          selectedLabelStyle: TextStyle(
            color: Colors.green
          ),
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeIcon,color: Colors.white,),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeIcon,color: Colors.white,),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeIcon,color: Colors.white,),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeIcon,color: Colors.white,),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.userIcon,color: Colors.white,),label: ''),
          ],
        ),
      ),
    );
  }
}
