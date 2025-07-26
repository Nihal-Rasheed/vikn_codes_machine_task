import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes/controller/invoice_controller.dart';
import 'package:vikn_codes/service/share_pref_service.dart';
import 'package:vikn_codes/utils/app_colors.dart';
import 'package:vikn_codes/view/common_widget/common_divider.dart';
import 'package:vikn_codes/view/filter_screen.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _callApi();
  }

  _callApi() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<InvoiceController>().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldbgColor,
        foregroundColor: Colors.white,
        title: Text('Invoices'),
      ),
      body: SingleChildScrollView(
        child: Consumer<InvoiceController>(
          builder: (context, provider, child) => provider.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
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
                                onTapOutside: (v) {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                },
                                controller: _searchController,
                                onChanged: (value) {
                                  context.read<InvoiceController>().searchData(_searchController.text);
                                },
                                style: TextStyle(
                                  color: AppColors.appWhite
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff08131E),
                                  hintText: 'Search Customer...',
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilterScreen(),
                                  ),
                                );
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: AppColors.dividerColor),

                    ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return CommonDivider();
                      },
                      itemCount: provider.invoiceModel?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = provider.invoiceModel?[index];
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
                                      TextSpan(text: item?.voucherNo),
                                    ],
                                  ),
                                ),
                                Text(
                                  item?.customerName ?? '',
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
                                  item?.status ?? '',
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
                                      TextSpan(
                                        text: item?.grandTotal.toString(),
                                      ),
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
      ),
    );
  }
}
