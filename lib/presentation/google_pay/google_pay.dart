import 'package:flutter/cupertino.dart';
import 'package:pay/pay.dart';

import '../../domain/product_model/product_model.dart';

class GooglePay extends StatelessWidget {
  const GooglePay({
    super.key,
    required this.total,
    required this.products,
  });
  final String total;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final List<PaymentItem> paymentItems = products
        .map(
          (Product product) => PaymentItem(
            label: product.productName,
            amount: product.productPrice.toString(),
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price,
          ),
        )
        .toList();

    paymentItems.add(
      PaymentItem(
        label: 'Total',
        amount: total,
        status: PaymentItemStatus.final_price,
      ),
    );

    void onGooglePaymentResult(Map<String, dynamic> result) {
      debugPrint(result.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
        paymentConfigurationAsset: 'payment_profile_google_pay.json',
        onPaymentResult: onGooglePaymentResult,
        paymentItems: paymentItems,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        loadingIndicator: const CupertinoActivityIndicator(),
      ),
    );
  }
}
