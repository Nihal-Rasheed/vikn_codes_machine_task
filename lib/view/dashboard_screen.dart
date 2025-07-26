import 'package:fl_chart/fl_chart.dart';
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
          child: SingleChildScrollView(
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
                _buildChartWidget(),
            
                _buildDashboardTile(
                  iconPath: AppIcons.stickerIcon,
                  title: "Bookings",
                  value: '665.0',
                  subtitle: "Reserved",
                  color: AppColors.lightOrange,
                  onTap: () {},
                ),
                _buildDashboardTile(
                  iconPath: AppIcons.moneybagIcon,
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
      ),
    );
  }


  Widget _buildChartWidget(){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryBgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'SAR ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextcolor,
                          ),
                        ),
                        TextSpan(text: '233234232'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextcolor
                      ),
                      children: [
                        TextSpan(
                          text: '+21% ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.appGreen,
                          ),
                        ),
                        TextSpan(text: 'than last month.'),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Revenue',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.appWhite
              ),)
            ],
            
          ),
          _buildGraph(),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(6, (index) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color:
                  index==1?AppColors.primaryColor:
                  Color(0xff131313)
                ),
                height: 32,width: 32,
                child: Text('${index+1}',
                style: TextStyle(
                  color: AppColors.appWhite
                ),
                ),
              ),)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGraph(){
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.graphColor.withValues(alpha: 0.6),
                    AppColors.graphColor.withValues(alpha: 0.2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 3.5),
                FlSpot(5, 4),
                FlSpot(6, 3),
              ],
            ),
          ],
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
