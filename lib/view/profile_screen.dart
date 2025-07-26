import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes/controller/profile_controller.dart';
import 'package:vikn_codes/service/share_pref_service.dart';
import 'package:vikn_codes/utils/app_assets.dart';
import 'package:vikn_codes/utils/app_icons.dart';
import 'package:vikn_codes/view/common_widget/common_divider.dart';
import 'package:vikn_codes/view/login_screen.dart';

import '../utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _callApi();
  }

  _callApi(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileController>().getProfileDetails();
    },);
  }

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
                        spacing: 10,
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
                          Expanded(
                            child: Consumer<ProfileController>(
                              builder: (context, provider, child) =>
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(provider.userName??'',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(provider.userEmail??'',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightBlue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.editIcon,
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
                              iconPath: AppIcons.starsIcon,
                              titleIcon: Icons.star
                            ),
                          ),
                          Expanded(
                            child: _buildProfileInfoTile(
                                title: 'KYC',
                                value: '2,23',
                                subtitle: 'rides',
                                color: AppColors.lightgreen,
                                iconPath: AppIcons.shieldIcon,
                                titleIcon: Icons.cloud_done
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: (){
                            SharedPrefService.clearTokens();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.scaffoldbgColor,
                            foregroundColor: AppColors.appRed,
                            padding: EdgeInsets.symmetric(vertical: 22)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              SvgPicture.asset(AppIcons.logoutIcon),
                              Text('Logout',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),)
                            ],
                          ))
                    ],
                  ),
                ),

                _buildMenuTile(iconPath: AppIcons.badgeIcon, text: 'Help'),
                _buildMenuTile(iconPath: AppIcons.searchStatusIcon, text: 'FAQ'),
                _buildMenuTile(iconPath: AppIcons.inviteIcon, text: 'Invite Friends'),
                _buildMenuTile(iconPath: AppIcons.shieldSearchIcon, text: 'Terms of service'),
                _buildMenuTile(iconPath: AppIcons.securityIcon, text: 'Privacy Policy'),
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
