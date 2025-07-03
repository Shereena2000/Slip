import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/views/sales_view/widgets/custom_icon_circle.dart';

class SalesTile extends StatelessWidget {
  final String customerName;
  final String date;
  final String time;
  final String billNumber;
  final double amount;
  final bool isPaid;
  final VoidCallback? onEditPressed;
  final VoidCallback? onPayPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onDetailsPressed;

  const SalesTile({
    super.key,
    required this.customerName,
    required this.date,
    required this.time,
    required this.billNumber,
    required this.amount,
    required this.isPaid,
    this.onEditPressed,
    this.onPayPressed,
    this.onDeletePressed,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with customer name and amount
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$date • $time',
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹ ${amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (!isPaid) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Due ${amount.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 208, 26, 114),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Progress indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: primaryColor,
                ),
              ),
            ],
          ),

          // Bill number and action buttons
          Container(
            padding: EdgeInsets.all(10),
            color: const Color.fromARGB(123, 226, 244, 252),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Bill No : $billNumber',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Action buttons
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    // Edit button
                    CustomIconCircle(
                      icon: Icons.edit,
                      backgroundColor: onSurface,
                    ),
                    const SizedBox(width: 5),

                    // Pay/Paid button
                    isPaid
                        ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.teal,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Paid',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                        : Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Pay Now',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                    const SizedBox(width: 5),

                    // Delete button
                    CustomIconCircle(
                      icon: Icons.close,
                      backgroundColor: redColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Details button
          GestureDetector(
            onTap: onDetailsPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 12, color: primaryColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
