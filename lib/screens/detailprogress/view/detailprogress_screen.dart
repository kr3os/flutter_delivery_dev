
import 'package:delivery_app/components/my_receipt.dart';
import 'package:delivery_app/global/models/restaurant.dart';
import 'package:delivery_app/global/services/auth/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsProgressScreen extends StatefulWidget {
  const DetailsProgressScreen({super.key});

  @override
  State<DetailsProgressScreen> createState() => _DetailsProgressScreenState();
}

class _DetailsProgressScreenState extends State<DetailsProgressScreen> {

  // get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    // if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDataBase(receipt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Delivery in progress'),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt()
        ],
      ),
    );
  }

  // Custom Bottom Nav Bar -Message / Call delivery dirver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [

          // Profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),

          // Driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mitch Koko",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              Text(
                "Filler",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
            ],
          ),

          const Spacer(),

          // message button 
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10),

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
          // call button
        ],
      ),
    );
  }
}