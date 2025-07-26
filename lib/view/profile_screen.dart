import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vikn_codes/utils/app_assets.dart';
import 'package:vikn_codes/utils/app_icons.dart';
import 'package:vikn_codes/view/common_widget/dashboard_tile_widget.dart';

import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldbgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColors.scaffoldbgColor,
                              borderRadius: BorderRadius.circular(17),
                              image: DecorationImage(
                                image: AssetImage(AppAssets.dp),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'David Arnol',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'dhbdhjdb#jdbdbnd',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightBlue,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            AppIcons.userIcon,
                            color: Colors.white,
                            height: 24,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildProfileInfoTile(
                              title: '4.3',
                              value: '2,23',
                              subtitle: 'rides',
                              color: AppColors.lightBlue,
                              iconPath: AppIcons.homeIcon,
                              titleIcon: Icons.star
                            ),
                          ),
                          Expanded(
                            child: _buildProfileInfoTile(
                                title: 'KYC',
                                value: '2,23',
                                subtitle: 'rides',
                                color: AppColors.lightgreen,
                                iconPath: AppIcons.homeIcon,
                                titleIcon: Icons.cloud_done
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.scaffoldbgColor,
                            foregroundColor: AppColors.appRed,
                            padding: EdgeInsets.symmetric(vertical: 22)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(Icons.logout,size: 24,),
                              Text('Logout',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),)
                            ],
                          ))
                    ],
                  ),
                ),
            
                _buildMenuTile(iconPath: AppIcons.homeIcon, text: 'hdvbhjvdhjd'),
                _buildMenuTile(iconPath: AppIcons.homeIcon, text: 'hdvbhjvdhjd'),
                _buildMenuTile(iconPath: AppIcons.homeIcon, text: 'hdvbhjvdhjd'),
                _buildMenuTile(iconPath: AppIcons.homeIcon, text: 'hdvbhjvdhjd'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required String iconPath,
    required String text
}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(iconPath,height: 24,color: AppColors.lightBlue,),
          Text(text,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),),
          Spacer(),
          Icon(Icons.navigate_next_outlined,color: Colors.white,)
        ],
      ),
    );
  }

  Widget _buildProfileInfoTile({
    required String iconPath,
    required IconData titleIcon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.scaffoldbgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 78,
            padding: EdgeInsets.symmetric(horizontal: 8),
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
              Row(
            spacing: 3,
                children: [
                  Text(title,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),),
        Icon(titleIcon,color: Colors.white,size: 15,)
                ],
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyTextcolor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
