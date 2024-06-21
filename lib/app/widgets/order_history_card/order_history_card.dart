import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/entities/transaction_data.dart';
import 'package:intl/intl.dart';

import '../../resource/colors_data.dart';
import '../../resource/styles.dart';

class OrderHistoryCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String clientName;
  final String weight;
  final String totalPrice;
  final String stateOrder;
  final bool orderDone;

  OrderHistoryCard({
    Key? key,
    required this.orderNumber,
    required this.date,
    required this.clientName,
    required this.weight,
    required this.totalPrice,
    required this.stateOrder,
    this.orderDone = false,
  }) : super(key: key);

  factory OrderHistoryCard.fromTransactionData(
          TransactionData transactionData, String name) =>
      OrderHistoryCard(
          orderNumber: transactionData.number,
          date: DateFormat("dd-MM-yyyy").format(transactionData.createdAt),
          clientName: name,
          weight: transactionData.totalWeight.toString(),
          totalPrice: transactionData.totalPrice.toString(),
          stateOrder: transactionData.status == "waiting"
              ? "history_transaction_menunggu_angkut".tr
              : "history_transaction_transaksi_berhasil".tr);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsCustom.primaryColor.green,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(vertical: 5),
            color: ColorsCustom.primaryColor.green,
            child: Text(
              'Order $orderNumber',
              style: TextStyleCustom.textDefault.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.2),
                2: FractionColumnWidth(0.7),
              },
              border: TableBorder.all(
                width: 0,
                color: Colors.transparent,
              ),
              children: [
                TableRow(
                  children: [
                    Text('Tanggal'),
                    Text(':'),
                    Text(
                      date,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Client'),
                    Text(':'),
                    Text(clientName),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Total Berat'),
                    Text(':'),
                    Text('$weight Kg'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Total Harga'),
                    Text(':'),
                    Text('HP $totalPrice'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            stateOrder,
            style: TextStyleCustom.textDefault.copyWith(
              color: orderDone
                  ? ColorsCustom.primaryColor.green
                  : ColorsCustom.primaryColor.midOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
