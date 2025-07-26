import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vikn_codes/utils/app_assets.dart';
import 'package:vikn_codes/utils/app_colors.dart';
import 'package:vikn_codes/utils/app_icons.dart';
import 'package:vikn_codes/view/invoices_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            spacing: 15,
            children: [
              Row(
                spacing: 5,
                children: [
                  Image.asset("assets/images/Group.png"),
                  Text(
                    "CabZing",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primaryBgColor,
                    backgroundImage: AssetImage(AppAssets.dp),
                  ),
                ],
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.primaryBgColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              _buildDashboardTile(
                iconPath: AppIcons.userIcon,
                title: "Bookings",
                value: '665.0',
                subtitle: "Reserved",
                color: AppColors.lightOrange,
                onTap: () {},
              ),
              _buildDashboardTile(
                iconPath: AppIcons.userIcon,
                title: "Invoices",
                value: '45434.0',
                subtitle: "Rupees",
                color: AppColors.lightgreen,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InvoicesPage(),));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardTile({
    required String iconPath,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryBgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(111),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 18,
              color: AppColors.iconColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyTextcolor,
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Color(0xff131313),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
