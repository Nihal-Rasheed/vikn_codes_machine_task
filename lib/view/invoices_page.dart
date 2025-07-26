import 'package:flutter/material.dart';
import 'package:vikn_codes/utils/app_colors.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldbgColor,
        foregroundColor: Colors.white,
        title: Text('Invoices'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: AppColors.dividerColor),
            IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextField(
                       onTapOutside:(v){
                         FocusManager.instance.primaryFocus!.unfocus();
              },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff08131E),
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff1B2B30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.filter_list_rounded,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            'Add Filter',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: AppColors.dividerColor),

            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              separatorBuilder: (context, index) {
                return _buildCustomContainer();
              },
              itemCount: 14,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: '#  ',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextcolor,
                                ),
                              ),
                              TextSpan(text: 'Invoice No'),
                            ],
                          ),
                        ),
                        Text(
                          'Customer Name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Pending',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.appRed,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: 'SAR.  ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextcolor,
                                ),
                              ),
                              TextSpan(text: 'Invoice No'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          // stops: [
          //   0.1,0.4,0.5,0.6,0.9
          // ],
          colors: [
            AppColors.scaffoldbgColor,
            // AppColors.primaryColor.withValues(alpha: 0.2),
            AppColors.primaryColor.withValues(alpha: 0.6),
            // AppColors.primaryColor.withValues(alpha: 0.2),
            AppColors.scaffoldbgColor,
          ],
        ),
      ),
    );
  }
}
