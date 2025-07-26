// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  final num? statusCode;
  final List<InvoiceData>? data;
  final num? totalCount;

  InvoiceModel({
    this.statusCode,
    this.data,
    this.totalCount,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    statusCode: json["StatusCode"],
    data: json["data"] == null ? [] : List<InvoiceData>.from(json["data"]!.map((x) => InvoiceData.fromJson(x))),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total_count": totalCount,
  };
}

class InvoiceData {
  final num? index;
  final String? id;
  final String? voucherNo;
  final DateTime? date;
  final String? ledgerName;
  final num? totalGrossAmtRounded;
  final num? totalTaxRounded;
  final num? grandTotalRounded;
  final String? customerName;
  final num? totalTax;
  final String? status;
  final num? grandTotal;
  final bool? isBillwised;
  final String? billwiseStatus;

  InvoiceData({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillwised,
    this.billwiseStatus,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
    index: json["index"],
    id: json["id"],
    voucherNo: json["VoucherNo"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    ledgerName: json["LedgerName"],
    totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
    totalTaxRounded: json["TotalTax_rounded"]?.toDouble(),
    grandTotalRounded: json["GrandTotal_Rounded"],
    customerName: json["CustomerName"],
    totalTax: json["TotalTax"]?.toDouble(),
    status: json["Status"],
    grandTotal: json["GrandTotal"],
    isBillwised: json["is_billwised"],
    billwiseStatus: json["billwise_status"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "id": id,
    "VoucherNo": voucherNo,
    "Date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "LedgerName": ledgerName,
    "TotalGrossAmt_rounded": totalGrossAmtRounded,
    "TotalTax_rounded": totalTaxRounded,
    "GrandTotal_Rounded": grandTotalRounded,
    "CustomerName": customerName,
    "TotalTax": totalTax,
    "Status": status,
    "GrandTotal": grandTotal,
    "is_billwised": isBillwised,
    "billwise_status": billwiseStatus,
  };
}


