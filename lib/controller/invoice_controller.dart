import 'package:flutter/cupertino.dart';
import 'package:vikn_codes/service/api_service.dart';
import 'package:vikn_codes/service/share_pref_service.dart';

import '../model/invoice_model.dart';

class InvoiceController extends ChangeNotifier{
  final _httpService = HttpService();
  bool isLoading =true;
  List<InvoiceData>? invoiceModel;
  List<InvoiceData>? _originalList;

   void getData()async{

       final userId = await SharedPrefService.getUserID();
       final token = await SharedPrefService.getAccessToken();
       final url = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
       final body = {
         "BranchID": 1,
         "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
         "CreatedUserID": userId,
         "PriceRounding": 2,
         "page_no": 1,
         "items_per_page": 10,
         "type": "Sales",
         "WarehouseID": 1
       };
       final response = await  _httpService.post(url, body,token: token);
       if(response.statusCode==200){

         final model = invoiceModelFromJson(response.body);
         if(model.data!=null){
           invoiceModel = model.data;
           _originalList = model.data;
           isLoading = false;
           notifyListeners();
         }
       }

       isLoading = false;
       notifyListeners();


  }


  searchData(String input){
    if (input.isEmpty) {
      invoiceModel = _originalList;
    } else {
      final searchResult = _originalList?.where((element) {
        final name = element.customerName?.toLowerCase() ?? '';
        return name.contains(input.toLowerCase());
      }).toList();

      invoiceModel = searchResult;
    }

    notifyListeners();
  }
}