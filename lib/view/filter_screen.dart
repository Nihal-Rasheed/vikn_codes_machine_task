import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vikn_codes/utils/app_icons.dart';

import '../utils/app_colors.dart';
import 'common_widget/common_divider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldbgColor,
        foregroundColor: Colors.white,
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.visibility,color: AppColors.primaryColor,)),
          Text('Filter',style: TextStyle(
            color: AppColors.primaryColor
          ),),
          SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 18,
          children: [
            Divider(color: AppColors.dividerColor,),
            Align(
              alignment: Alignment.center,
              child: _buildChip(
                  title:'This Month',
                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 15),
                  icon: Icons.keyboard_arrow_down),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                _buildCalenderChip('12/09/2023'),
                _buildCalenderChip('12/15/2023'),
              ],
            ),

            Divider(color: AppColors.dividerColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildChip(title: 'Pending',color: AppColors.primaryColor),
                _buildChip(title:'Invoiced'),
                _buildChip(title: 'Cancelled'),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.dividerColor),
                  color: Color(0xff08131E)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Customer',style: TextStyle(
                      color: AppColors.appWhite
                  ),),
                  Icon(Icons.keyboard_arrow_down,color: AppColors.appWhite,)
                ],
              ),
            ),

            CommonDivider(),

            _buildChip(title: 'Nihal Rasheed k', icon: Icons.close),
          ],
        ),
      ),
    );
  }

  Widget _buildCalenderChip(String title){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xff1B2B30)
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.calendarIcon,color: AppColors.primaryColor,),
          Text(title,style: TextStyle(
              color: AppColors.appWhite
          ),),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String title,
    EdgeInsets? padding,
    Color? color,
    IconData? icon}){
    return Container(
      padding:padding?? EdgeInsets.symmetric(vertical: 12,horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:color?? Color(0xff1B2B30)
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: TextStyle(
              color: AppColors.appWhite
          ),),
          icon!=null?
          Icon(icon,color: AppColors.appWhite,):SizedBox.shrink()
        ],
      ),
    );
  }
}


