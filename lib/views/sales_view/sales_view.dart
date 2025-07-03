
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slip/bloc/sales/sales_cubit.dart';
import 'package:slip/bloc/sales/sales_state.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/constants/spacing.dart';
import 'package:slip/models/sales_model.dart';
import 'package:slip/views/sales_view/widgets/filter_tile.dart';
import 'package:slip/views/sales_view/widgets/sales_tile.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  void initState() {
    super.initState();
    // Load sales data when the view initializes
    context.read<SalesCubit>().loadSales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        foregroundColor: onSurface,
        backgroundColor: screenColor,
        leading:  IconButton(onPressed: () {
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back_ios)),
        title: const Text("Sales"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FilterTile(
              icon: Icons.search,
              title: const Text(
                "Name / Contact / Bill No",
                style: TextStyle(color: onSurface, fontSize: 14),
              ),
              trailing: const CircleAvatar(radius: 16, backgroundColor: screenColor),
            ),
            hSpace5,
            FilterTile(
              icon: Icons.calendar_month_outlined,
              title: const Text(
                "Today",
                style: TextStyle(color: dblackColor, fontSize: 14),
              ),
            ),
            hSpace5,
            FilterTile(
              icon: Icons.store_outlined,
              title: const Text(
                "Select Branch",
                style: TextStyle(color: onSurface, fontSize: 14),
              ),
            ),
            hSpace5,
            Expanded(
              child: BlocBuilder<SalesCubit, SalesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(
                      child: Text('Initializing...'),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (salesData) {
                        print("🎯 SalesData received: $salesData");
                      if (salesData.isEmpty||salesData==null) {
                        return const Center(
                          child: Text('No sales data available'),
                        );
                      }
                      
                      // Parse the API response
                      List<SaleModel> sales = [];
try {
  if (salesData[0] is Map &&
      salesData[0]['data'] is Map &&
      salesData[0]['data']['data'] is Map &&
      salesData[0]['data']['data']['results'] is List) {
    final results = salesData[0]['data']['data']['results'] as List;
    sales = results.map((json) => SaleModel.fromJson(json)).toList();
    print("✅ Parsed sales count: ${sales.length}");
  } else {
    print("❌ Unexpected structure in salesData[0]: ${salesData[0]}");
  }
} catch (e) {
  print("🚨 Error parsing salesData: $e");
}



                      return ListView.builder(
                        itemCount: sales.length,
                        itemBuilder: (context, index) {
                          final sale = sales[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SalesTile(
                              customerName: sale.customerName,
                              date: sale.date,
                              time: sale.time,
                              billNumber: sale.billNumber,
                              amount: sale.amount,
                              isPaid: sale.isPaid,
                              
                            ),
                          );
                        },
                      );
                    },
                    error: (message) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 48),
                          const SizedBox(height: 16),
                          Text(message),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SalesCubit>().loadSales();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showDeleteDialog(BuildContext context, SaleModel sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Sale'),
        content: Text('Are you sure you want to delete this sale for ${sale.customerName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showSnackBar(context, 'Sale deleted');
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showSaleDetails(BuildContext context, SaleModel sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sale Details - ${sale.customerName}'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bill Number: ${sale.billNumber}'),
            Text('Date: ${sale.date}'),
            Text('Time: ${sale.time}'),
            Text('Amount: ₹${sale.amount.toStringAsFixed(2)}'),
            Text('Paid: ₹${sale.paidAmount.toStringAsFixed(2)}'),
            if (!sale.isPaid) Text('Due: ₹${sale.dueAmount.toStringAsFixed(2)}'),
            Text('Payment Status: ${sale.paymentStatus}'),
            Text('Payment Method: ${sale.paymentMethod}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}