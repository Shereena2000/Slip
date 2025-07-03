import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:slip/views/sales_view/widgets/filter_tile.dart';
import 'package:slip/views/sales_view/widgets/sales_tile.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        foregroundColor: onSurface,
        backgroundColor: screenColor,
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Sales"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FilterTile(
              icon: Icons.search,
              title: Text(
                "Name / Contact / Bill No",
                style: TextStyle(color: onSurface, fontSize: 14),
              ),trailing: CircleAvatar(radius: 16,backgroundColor: screenColor,),
            ),    SizedBox(height: 5),
            FilterTile(
              icon: Icons.calendar_month_outlined,
              title: Text(
                "Today",
                style: TextStyle(color: dblackColor, fontSize: 14),
              ),
            ),
            SizedBox(height: 5),
            FilterTile(
              icon: Icons.store_outlined,
              title: Text(
                "Select Branch",
                style: TextStyle(color: onSurface, fontSize: 14),
              ),
            ),  SizedBox(height: 5),
            SalesTile(customerName: "Walk-in-Customer", date: "02 Jul,25", time: "5:38Pm", billNumber: "253637484", amount: 101, isPaid: false)
          ],
        ),
      ),
    );
  }
}

