import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_prototype/models/cards.dart';
import 'package:wallet_prototype/models/transactions.dart';

String cardNumberDisplay(int number) {
  final String textNumber = number.toString();
  String displayableNumber = '';
  for (var i = 0; i < 16; i++) {
    if (i > 3 && i < 12) {
      displayableNumber += '*';
    } else {
      displayableNumber += textNumber[i];
    }
    if ((i + 1) % 4 == 0) {
      displayableNumber += ' ';
    }
  }
  return displayableNumber;
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overAllWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Container(
            color: const Color.fromARGB(255, 245, 245, 243),
            child: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.transparent,
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
              ),
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              title: const Align(
                alignment: Alignment(-0.3, 0),
                child: Text(
                  'Wallet',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              leadingWidth: (0.05 * overAllWidth * 2) + 32,
              leading: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: CircleAvatar(
                  backgroundImage: const AssetImage(
                    'assets/person-glasses-profile.jpg',
                  ),
                  radius: 0.05 * overAllWidth,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 32,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 18),
          child: SizedBox(
            height: 254,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(16),
                      padding: const EdgeInsets.all(6),
                      color: Colors.black,
                      strokeWidth: 3,
                      dashPattern: const [20, 10],
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: SizedBox(
                          height: 244,
                          child: Center(
                            child: IconButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ...verifiedCards.map((item) => creditCardDesign(item)),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26.0, right: 18.0, top: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {},
                  child:  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.tune))),
            ],
          ),
        ),
        Column(
          children: transactionsItem
              .map((item) => Container(
                    margin: const EdgeInsets.only(left: 26, right: 26, top: 12),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: item.iconColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(26)),
                              child: Icon(
                                item.icon,
                                color: item.iconColor,
                                size: 36,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  item.type ?? '',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          item.isWithdraw
                              ? '-\$${item.amount}'
                              : '-\$${item.amount}',
                          style: TextStyle(
                              color:
                                  item.isWithdraw ? Colors.red : Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    ));
  }

  Container creditCardDesign(Cards item) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: item.cardColor,
            ),
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          '\$${item.totalBalance}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/${item.type}-credit-card.png',
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  cardNumberDisplay(item.number),
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, letterSpacing: 2),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(12),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(item.clientName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Exp', style: TextStyle(color: Colors.grey)),
                    Text(
                        '${item.expiration.toString()[5]}${item.expiration.toString()[6]}/${item.expiration.toString()[2]}${item.expiration.toString()[3]}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Transactions> transactionsItem = [
  Transactions(
      icon: Icons.laptop_chromebook_sharp,
      iconColor: Colors.yellow,
      title: 'Adobe Illustrator',
      type: 'Subcription fee',
      amount: '15.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.laptop_chromebook_sharp,
      iconColor: Colors.yellow,
      title: 'Dribble',
      type: 'Subcription fee',
      amount: '50.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.shopping_bag,
      iconColor: Colors.pink,
      title: 'Sony Camera',
      type: 'Shopping fee',
      amount: '200.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.credit_card,
      iconColor: Colors.green,
      title: 'Paypal',
      type: 'Salary',
      amount: '32.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.laptop_chromebook_sharp,
      iconColor: Colors.yellow,
      title: 'Dribble',
      type: 'Subcription fee',
      amount: '50.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.shopping_bag,
      iconColor: Colors.pink,
      title: 'Sony Camera',
      type: 'Shopping fee',
      amount: '200.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.credit_card,
      iconColor: Colors.green,
      title: 'Paypal',
      type: 'Salary',
      amount: '32.00',
      isWithdraw: true),
];

List<Cards> verifiedCards = [
  Cards(
      number: 1234567891234567,
      clientName: 'ClientName',
      cardColor: Colors.white,
      type: 'visa',
      expiration: DateTime(2025, 08),
      totalBalance: '13,400.50'),
  Cards(
      number: 1234567891234567,
      clientName: 'ClientName',
      cardColor: const Color.fromARGB(255, 235, 235, 108),
      type: 'mastercard',
      expiration: DateTime(2023, 09),
      totalBalance: '25,000.40'),
];
