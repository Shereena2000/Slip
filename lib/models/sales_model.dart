class SaleModel {
  final String id;
  final String customerName;
  final String date;
  final String time;
  final String billNumber;
  final double amount;
  final bool isPaid;
  final String paymentStatus;
  final String paymentMethod;
  final double paidAmount;
  final double grandTotal;

  SaleModel({
    required this.id,
    required this.customerName,
    required this.date,
    required this.time,
    required this.billNumber,
    required this.amount,
    required this.isPaid,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.paidAmount,
    required this.grandTotal,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    // Parse the date and time
    final saleDate = DateTime.parse(json['sale_date']);
    final formattedDate = "${saleDate.day.toString().padLeft(2, '0')} ${_getMonthName(saleDate.month)}, ${saleDate.year.toString().substring(2)}";
    final formattedTime = "${saleDate.hour.toString().padLeft(2, '0')}:${saleDate.minute.toString().padLeft(2, '0')} ${saleDate.hour >= 12 ? 'PM' : 'AM'}";

    // Get customer name - handle both cases
    String customerName = json['customer_name'] ?? 
                         json['customer_details']?['name'] ?? 
                         'Walk-in-Customer';

    return SaleModel(
      id: json['_id'] ?? '',
      customerName: customerName,
      date: formattedDate,
      time: formattedTime,
      billNumber: json['reference_no'] ?? '',
      amount: (json['grand_total'] ?? 0.0).toDouble(),
      isPaid: json['payment_status'] == 'Paid',
      paymentStatus: json['payment_status'] ?? 'Pending',
      paymentMethod: json['payment_method'] ?? 'Cash',
      paidAmount: (json['paid_amount'] ?? 0.0).toDouble(),
      grandTotal: (json['grand_total'] ?? 0.0).toDouble(),
    );
  }

  static String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  // Calculate due amount
  double get dueAmount => grandTotal - paidAmount;
}