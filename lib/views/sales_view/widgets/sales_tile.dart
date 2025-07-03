import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/constants/spacing.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          _buildProgressIndicator(),
          _buildBillNumberAndActionsSection(),
          _buildDetailsButton(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCustomerInfo(),
          _buildAmountInfo(),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Expanded(
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
          hSpace4,
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
    );
  }

  Widget _buildAmountInfo() {
    return Column(
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
      hSpace4,
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
    );
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _ProgressBar(width: 100),
        ],
      ),
    );
  }

  Widget _buildBillNumberAndActionsSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(123, 226, 244, 252),
      child: Row(
        children: [
          _buildBillNumber(),
          const Spacer(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBillNumber() {
    return Text(
      'Bill No : $billNumber',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildEditButton(),
       wSpace5,
        _buildPayButton(),
        wSpace5,
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildEditButton() {
    return GestureDetector(
      onTap: onEditPressed,
      child: const CustomIconCircle(
        icon: Icons.edit,
        backgroundColor: onSurface,
      ),
    );
  }

  Widget _buildPayButton() {
    return GestureDetector(
      onTap: isPaid ? null : onPayPressed,
      child: isPaid ? _buildPaidIndicator() : _buildPayNowButton(),
    );
  }

  Widget _buildPaidIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
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
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
          wSpace6,
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
    );
  }

  Widget _buildPayNowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Pay Now',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: onDeletePressed,
      child: const CustomIconCircle(
        icon: Icons.close,
        backgroundColor: redColor,
      ),
    );
  }

  Widget _buildDetailsButton() {
    return GestureDetector(
      onTap: onDetailsPressed,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            Icon(Icons.arrow_forward_ios, size: 12, color: primaryColor),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double width;

  const _ProgressBar({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: primaryColor,
      ),
    );
  }
}