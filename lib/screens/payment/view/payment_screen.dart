import 'package:flutter/material.dart'
;
import 'package:delivery_app/components/my_button.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:delivery_app/screens/detailprogress/view/view.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formkey.currentState!.validate()) {
      // only show dialog if form is valid,
       showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
           actions: [
            // cancel button
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel')
            ),
            // yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const DetailsProgressScreen()
                ));
              },
              child: const Text('Yes')
            ),
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      // TODO: Check here how to deal with the keyboard overflowed
      body: Column(
        children: [
          // credit card 
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0) {},
          ),
      
          CreditCardForm(
            formKey: formkey, 
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data) { 
              setState(() {
                cardNumber = data.cardNumber; 
                expiryDate = data.expiryDate; 
                cardHolderName = data.cardHolderName; 
                cvvCode = data.cvvCode; 
              });
            },
          ),
          const Spacer(),
      
          MyButton(
            onTap: userTappedPay,
            text: 'Pay now'
          )
        ],
      ),
    );
  }
}