// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListModelFromJson(String str) => List<OrderListModel>.from(json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  String dhanClientId;
  String orderId;
  String exchangeOrderId;
  String correlationId;
  String orderStatus;
  String transactionType;
  String exchangeSegment;
  String productType;
  String orderType;
  String validity;
  String tradingSymbol;
  String securityId;
  int quantity;
  int disclosedQuantity;
  double price;
  double triggerPrice;
  bool afterMarketOrder;
  int boProfitValue;
  int boStopLossValue;
  String legName;
  DateTime createTime;
  DateTime updateTime;
  DateTime exchangeTime;
  DateTime drvExpiryDate;
  String drvOptionType;
  int drvStrikePrice;
  String omsErrorCode;
  String omsErrorDescription;
  int filledQty;
  String algoId;

  OrderListModel({
    required this.dhanClientId,
    required this.orderId,
    required this.exchangeOrderId,
    required this.correlationId,
    required this.orderStatus,
    required this.transactionType,
    required this.exchangeSegment,
    required this.productType,
    required this.orderType,
    required this.validity,
    required this.tradingSymbol,
    required this.securityId,
    required this.quantity,
    required this.disclosedQuantity,
    required this.price,
    required this.triggerPrice,
    required this.afterMarketOrder,
    required this.boProfitValue,
    required this.boStopLossValue,
    required this.legName,
    required this.createTime,
    required this.updateTime,
    required this.exchangeTime,
    required this.drvExpiryDate,
    required this.drvOptionType,
    required this.drvStrikePrice,
    required this.omsErrorCode,
    required this.omsErrorDescription,
    required this.filledQty,
    required this.algoId,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    dhanClientId: json["dhanClientId"],
    orderId: json["orderId"],
    exchangeOrderId: json["exchangeOrderId"],
    correlationId: json["correlationId"],
    orderStatus: json["orderStatus"],
    transactionType: json["transactionType"],
    exchangeSegment: json["exchangeSegment"],
    productType: json["productType"],
    orderType: json["orderType"],
    validity: json["validity"],
    tradingSymbol: json["tradingSymbol"],
    securityId: json["securityId"],
    quantity: json["quantity"],
    disclosedQuantity: json["disclosedQuantity"],
    price: json["price"]?.toDouble(),
    triggerPrice: json["triggerPrice"],
    afterMarketOrder: json["afterMarketOrder"],
    boProfitValue: json["boProfitValue"],
    boStopLossValue: json["boStopLossValue"],
    legName: json["legName"],
    createTime: DateTime.parse(json["createTime"]),
    updateTime: DateTime.parse(json["updateTime"]),
    exchangeTime: DateTime.parse(json["exchangeTime"]),
    drvExpiryDate: DateTime.parse(json["drvExpiryDate"]),
    drvOptionType: json["drvOptionType"],
    drvStrikePrice: json["drvStrikePrice"],
    omsErrorCode: json["omsErrorCode"],
    omsErrorDescription: json["omsErrorDescription"],
    filledQty: json["filled_qty"],
    algoId: json["algoId"],
  );

  Map<String, dynamic> toJson() => {
    "dhanClientId": dhanClientId,
    "orderId": orderId,
    "exchangeOrderId": exchangeOrderId,
    "correlationId": correlationId,
    "orderStatus": orderStatus,
    "transactionType": transactionType,
    "exchangeSegment": exchangeSegment,
    "productType": productType,
    "orderType": orderType,
    "validity": validity,
    "tradingSymbol": tradingSymbol,
    "securityId": securityId,
    "quantity": quantity,
    "disclosedQuantity": disclosedQuantity,
    "price": price,
    "triggerPrice": triggerPrice,
    "afterMarketOrder": afterMarketOrder,
    "boProfitValue": boProfitValue,
    "boStopLossValue": boStopLossValue,
    "legName": legName,
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime.toIso8601String(),
    "exchangeTime": exchangeTime.toIso8601String(),
    "drvExpiryDate": "${drvExpiryDate.year.toString().padLeft(4, '0')}-${drvExpiryDate.month.toString().padLeft(2, '0')}-${drvExpiryDate.day.toString().padLeft(2, '0')}",
    "drvOptionType": drvOptionType,
    "drvStrikePrice": drvStrikePrice,
    "omsErrorCode": omsErrorCode,
    "omsErrorDescription": omsErrorDescription,
    "filled_qty": filledQty,
    "algoId": algoId,
  };
}
