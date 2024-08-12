import 'package:flutter/material.dart';
import 'package:wallet_prototype/models/earnings.dart';
import 'package:wallet_prototype/models/transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overAllWidth = MediaQuery.of(context).size.width;
    const totalBalance = '25,000.40';
    const incomeBalance = '25,000';
    const outcomeBalance = '18,000';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 36),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          'assets/person-glasses-profile.jpg',
                        ),
                        radius: 0.05 * overAllWidth,
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning!'),
                        Text(
                          'Client Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 26),
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Text(
                  '\$ $totalBalance',
                  style: TextStyle(
                      color: Colors.white, fontSize: 36, letterSpacing: 2),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'My Wallet',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                        size: 36,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
            child: const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
                          size: 36,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Income',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '\$ $incomeBalance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                          size: 36,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Outcome',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '\$ $outcomeBalance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Earnings',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('See All',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: earnings.map((item) => earningCard(item)).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 18.0, top: 18),
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
                    child: const Text('See All',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 26.0),
            child: Text(
              'Today',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          Column(
            children: transactionsItem
                .map((item) => Container(
                      margin:
                          const EdgeInsets.only(left: 26, right: 26, top: 12),
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
                                        fontSize: 14,fontWeight: FontWeight.w500
                                        ),
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
                                  fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Container earningCard(EarningsInfo item) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 14),
      width: 125,
      decoration: BoxDecoration(
          color: item.color, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white60, borderRadius: BorderRadius.circular(28)),
            child: Center(
              child: Text(
                item.mainIcon,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '\$${item.amount}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



List<EarningsInfo> earnings = [
  EarningsInfo(
      title: 'Upwork', amount: '3,000', color: Colors.red, mainIcon: 'U'),
  EarningsInfo(
      title: 'Freepik', amount: '3,000', color: Colors.pink, mainIcon: 'F'),
  EarningsInfo(
      title: 'Paypal', amount: '2,600', color: Colors.blue, mainIcon: 'W'),
  EarningsInfo(
      title: 'OpenAI', amount: '1,000', color: Colors.green, mainIcon: 'O'),
];



List<Transactions> transactionsItem = [
  Transactions(
      icon: Icons.laptop_chromebook_sharp,
      iconColor: Colors.yellow,
      title: 'Adobe Illustrator',
      type: 'Subcription fee',
      amount: '30.00',
      isWithdraw: true),
  Transactions(
      icon: Icons.laptop_chromebook_sharp,
      iconColor: Colors.yellow,
      title: 'Dribble',
      type: 'Subcription fee',
      amount: '15.00',
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
      isWithdraw: false),
];
